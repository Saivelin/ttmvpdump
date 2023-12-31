PGDMP         6                {            ttmvp    15.2    15.2 $    *           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            +           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ,           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            -           1262    31569    ttmvp    DATABASE     y   CREATE DATABASE ttmvp WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE ttmvp;
                postgres    false            �            1259    34096    comments    TABLE     �   CREATE TABLE public.comments (
    id integer NOT NULL,
    "userID" integer DEFAULT 1,
    comment text DEFAULT ''::text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "videoId" integer
);
    DROP TABLE public.comments;
       public         heap    postgres    false            �            1259    34095    comments_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.comments_id_seq;
       public          postgres    false    221            .           0    0    comments_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;
          public          postgres    false    220            �            1259    33939 	   favorites    TABLE     �   CREATE TABLE public.favorites (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" integer,
    "videoId" integer
);
    DROP TABLE public.favorites;
       public         heap    postgres    false            �            1259    33938    favorites_id_seq    SEQUENCE     �   CREATE SEQUENCE public.favorites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.favorites_id_seq;
       public          postgres    false    219            /           0    0    favorites_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.favorites_id_seq OWNED BY public.favorites.id;
          public          postgres    false    218            �            1259    31571    users    TABLE     �  CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(255) DEFAULT ''::character varying,
    password character varying(255),
    role character varying(255) DEFAULT 'user'::character varying,
    about text DEFAULT ''::text,
    logo character varying(255) DEFAULT ''::character varying,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    email character varying(255) DEFAULT ''::character varying
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    31570    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    215            0           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    214            �            1259    31584    videos    TABLE     \  CREATE TABLE public.videos (
    id integer NOT NULL,
    title character varying(255) DEFAULT 'video'::character varying,
    about character varying(255) DEFAULT ''::character varying,
    hashtags character varying(255)[] DEFAULT (ARRAY[]::character varying[])::character varying(255)[],
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" integer,
    preview character varying(255) DEFAULT ''::character varying,
    file character varying(255) DEFAULT ''::character varying,
    likes integer DEFAULT 0,
    views integer DEFAULT 0
);
    DROP TABLE public.videos;
       public         heap    postgres    false            �            1259    31583    videos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.videos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.videos_id_seq;
       public          postgres    false    217            1           0    0    videos_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.videos_id_seq OWNED BY public.videos.id;
          public          postgres    false    216            �           2604    34099    comments id    DEFAULT     j   ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);
 :   ALTER TABLE public.comments ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            �           2604    33942    favorites id    DEFAULT     l   ALTER TABLE ONLY public.favorites ALTER COLUMN id SET DEFAULT nextval('public.favorites_id_seq'::regclass);
 ;   ALTER TABLE public.favorites ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            t           2604    31574    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            z           2604    31587 	   videos id    DEFAULT     f   ALTER TABLE ONLY public.videos ALTER COLUMN id SET DEFAULT nextval('public.videos_id_seq'::regclass);
 8   ALTER TABLE public.videos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            '          0    34096    comments 
   TABLE DATA           ^   COPY public.comments (id, "userID", comment, "createdAt", "updatedAt", "videoId") FROM stdin;
    public          postgres    false    221   Q+       %          0    33939 	   favorites 
   TABLE DATA           V   COPY public.favorites (id, "createdAt", "updatedAt", "userId", "videoId") FROM stdin;
    public          postgres    false    219   n+       !          0    31571    users 
   TABLE DATA           k   COPY public.users (id, username, password, role, about, logo, "createdAt", "updatedAt", email) FROM stdin;
    public          postgres    false    215   �+       #          0    31584    videos 
   TABLE DATA           }   COPY public.videos (id, title, about, hashtags, "createdAt", "updatedAt", "userId", preview, file, likes, views) FROM stdin;
    public          postgres    false    217   �,       2           0    0    comments_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.comments_id_seq', 1, false);
          public          postgres    false    220            3           0    0    favorites_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.favorites_id_seq', 26, true);
          public          postgres    false    218            4           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 2, true);
          public          postgres    false    214            5           0    0    videos_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.videos_id_seq', 28, true);
          public          postgres    false    216            �           2606    34105    comments comments_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_pkey;
       public            postgres    false    221            �           2606    33944    favorites favorites_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.favorites DROP CONSTRAINT favorites_pkey;
       public            postgres    false    219            �           2606    31582    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    215            �           2606    31594    videos videos_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.videos
    ADD CONSTRAINT videos_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.videos DROP CONSTRAINT videos_pkey;
       public            postgres    false    217            �           2606    41831    comments comments_videoId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT "comments_videoId_fkey" FOREIGN KEY ("videoId") REFERENCES public.videos(id) ON UPDATE CASCADE ON DELETE SET NULL;
 J   ALTER TABLE ONLY public.comments DROP CONSTRAINT "comments_videoId_fkey";
       public          postgres    false    221    217    3209            �           2606    41817    favorites favorites_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT "favorites_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;
 K   ALTER TABLE ONLY public.favorites DROP CONSTRAINT "favorites_userId_fkey";
       public          postgres    false    3207    219    215            �           2606    41822     favorites favorites_videoId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT "favorites_videoId_fkey" FOREIGN KEY ("videoId") REFERENCES public.videos(id) ON UPDATE CASCADE ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.favorites DROP CONSTRAINT "favorites_videoId_fkey";
       public          postgres    false    3209    217    219            �           2606    41804    videos videos_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.videos
    ADD CONSTRAINT "videos_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;
 E   ALTER TABLE ONLY public.videos DROP CONSTRAINT "videos_userId_fkey";
       public          postgres    false    217    3207    215            '      x������ � �      %   D   x�32�4202�50�52R04�21�2��306�60�'e�id�ed������T���f$�^c�=... �j�      !   �   x�}ι�0 ��}
6c�!�!ފ��$�\�>�qSc����(�$�J�r�I=����h����\�ªI,f��ob%��鸫���Q����)U�  �)�`�!���iLFX%m������>���8G[�x>s��Y��`�Zjmy�w���(d���W�
JZk�kXA���?�kO�A��H;      #   �  x��ջjA�z�SR&Zt��>G�4�[��"�ݣ��8&&m8�l�����eپΟ�O���ߟ�ק������1� ��DrIw���_#ڜ�&�V�
*��)wȒ��<���_f��5�	g�s�&PetX��M3�ng����8?";�|�v?�����0�ے@�FlPM]J�.4^�r��ʍAi0T�f�ԝ=Mlwh�xhQ��{�4�'�C�H���f晇�Չ��1����r/*���F+��(jgWhœ��Y���B#9�ʫ�C�]2��{���h�ܭ��@�rޠ�����^WY�N�U���g���D@j�ژ:�k�=��m���Fr� ��DIΝSp-4���#�M�Zꚢc��IP��-4�Ԋ:7�3K���q�x��ߡ�+Z=�v���ζt-��n��h����U�!޽����6���k%�z��mk9k�4jx�Y�}�o����0�     