DROP TABLE IF EXISTS public.spatial_data CASCADE;
BEGIN;

CREATE TABLE public.spatial_data (
  id SERIAL PRIMARY KEY,
  geom geometry(PointZ, 4326) -- EPSG:4326はWGS 84座標系を指します。
);

-- 東京近辺のサンプルポイントデータを追加
INSERT INTO public.spatial_data (geom) VALUES
  (ST_SetSRID(ST_MakePoint(139.6917, 35.6895, 10.0), 4326)), -- 東京タワー近辺
  (ST_SetSRID(ST_MakePoint(139.7753, 35.7033, 15.0), 4326)), -- 上野公園近辺
  (ST_SetSRID(ST_MakePoint(139.7100, 35.6581, 5.0), 4326)),  -- 東京スカイツリー近辺
  (ST_SetSRID(ST_MakePoint(139.7633, 35.6751, 20.0), 4326)); -- 皇居近辺

COMMIT;
