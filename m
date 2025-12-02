Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A7A2F691F
	for <imx@lists.linux.dev>; Tue,  2 Dec 2025 20:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764709070; cv=none; b=smnCd+RB0bdGMAaYBnOiR22nfOXxAJ4z295mNS2ZV27qO+OX7cLQw1c7nVQPy6tPA1qm4VRmZ9r6M4LIIPc20I0mWv3hEDxt0TCuAG5AoJNo+5BnTe0ZZN6s2nqja+SHOB103kjummgQOqybXaF24xDv1RuGP5Gy49TTzdTs2Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764709070; c=relaxed/simple;
	bh=x9rIyZk6utCtob7FvBKYUhjd7o1cM0G63UuSoXp3R3I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UYBcEeP5u2aN+imz0YBIZ+s3BRcBXxA/lNliEOZgev3fx1er7EpR4tz9FH1eSlOw5Oe/uSxq3jsimk9MHuvMloJ0Odfh0nZQ55QAc99qXi+G0Mhb3tQ4FWm6RN/Ycbm4G0Km/yI32qrhXKpirUheueavIwd8jA06vQK5KZ2RC/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=E2ocx5u1; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="E2ocx5u1"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-88057f5d041so52936386d6.1
        for <imx@lists.linux.dev>; Tue, 02 Dec 2025 12:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1764709066; x=1765313866; darn=lists.linux.dev;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4H3VN3zAefmBh18Hhy5cG5wKA7ItOiC6cT8cRe/+Fbc=;
        b=E2ocx5u1+aHvB967uXUwwOL5y7ZXUzacEe/LcGhSBWmq0zl4PVmqcSEr+QHGLo6XXT
         xelco73U7GEygh8pDpN6F/JPjkjWuAL4qURGYclYAOKdHhZT5A73OLq+wqO6iTnUIOb9
         xzFrVFuJO9x8ClKT7iWbYAgijXXWlNDA1FKUCeLyaGlv6xBDOYzAIotT/jWE0hehcggz
         Mogj9q8/JcOrDSG2YXC+ZaAmT1usrqZuvDwRDJ2es0cardQrGiTV1ZhuL2z9NvBreaFk
         4waSzpQjK+pK5DyNSEQalJ+zAhr0FFx9epTpU9K91v8DQPiyfOvhae2B921d2xzSXNZS
         vQ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764709066; x=1765313866;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4H3VN3zAefmBh18Hhy5cG5wKA7ItOiC6cT8cRe/+Fbc=;
        b=DScamZvvN7oy1h1LDYUjSGTjeqmbi2F5AGHT9t9XfLnEF0bbT6cX9iyS/E3vUrvZrG
         MfnBXrwqK17/tDw9bTZ7LFHSAqE88r46/djLY9XFCyCKNMzb8CkN41rQ6XWUgBBuZwPg
         /+6xS+ibVtd7f0LFLa6JVeB05CAyDMcwi3mJNrrbk00rMlhV1xqBPuV/AIb211pTCIEp
         /+q/CYfa4PBvAzcyXGy5ACdbKNIXAJvi7V1QPtdSopGBAoajv5zzlDOmVihEvyFt4cAI
         MUIBHwTV5LIIcSDp68mJKPlws0B/0MI83+ABReMbIOqcILPHWjYAPPi0LSeS1y3RNbh3
         yGcw==
X-Forwarded-Encrypted: i=1; AJvYcCXDjMshgLeHAW09o4vTx7B6s1ZcsE+v4YKfaR9xa6th73VNWyhzSO8L2PpnW/MnJ6iWd+c=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzdh73oklIMXb81/6McoXEZYUCIUf/g+n3NRofn5XLfKF0vWlYK
	7iu9xwtoKj2HPJQRkRuQPB9obl7w6pOXETU76ktQgbF2rk2s7THpHx1fpZrVeJBHfzE=
X-Gm-Gg: ASbGncurse+WwYsE65ZekwuEwA33BD+BuzAIBAdQdlqAh43e9Iy3LQwNm12Q3TkWogc
	IL6ngL+JQaTpPCLe0YWlCZpfKODl39i9bHMTwgkeR0rJecVP0O5GI+cNLPCCTLD3u1VJSwOiokm
	3ubnc1Z5ai7a/HK/+TJZgnNvfkWumKzxxH8/13fLeWxgPzT1a3k8/hWQwkDrImJnXl5bM7O6FDH
	QQeSvlJYLLkzWQj73kFvTi23tDiHgD369ZTIL0gzsTHvkh9Yh92ytifbt9j+Xk2gTZQm6KHQEnD
	LlNwOuxle4WnESqTB7cydLh8MXuFbPkpAlVHpcM2Uu138k9208m7Yy8GeZJnT+OPdXdyYjgi+ex
	MyEbhQqiQNi4Ph3C0cnm+sdqx1SzQkixaFKlchm5xQg0/2iZmhb3kuCTE71KWyxE2ajYaufM8YY
	RW5R2YULs8+ELat2xR
X-Google-Smtp-Source: AGHT+IFH+ikokn56F8WtdIGm9omeFEnq21hwhYaklenSkqU+X/Ecfgee/D4+CUubViLT6t9CW8waOQ==
X-Received: by 2002:ad4:5bc8:0:b0:880:47de:c998 with SMTP id 6a1803df08f44-8863b0030b0mr487284446d6.38.1764709066104;
        Tue, 02 Dec 2025 12:57:46 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88652b90ebasm111262986d6.55.2025.12.02.12.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 12:57:45 -0800 (PST)
Message-ID: <99f3a6d843afb1c5c47b14e414b917920c3a5041.camel@ndufresne.ca>
Subject: Re: [PATCH v2 2/2] media: verisilicon: Avoid G2 bus error while
 decoding H.264 and HEVC
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	benjamin.gaignard@collabora.com, p.zabel@pengutronix.de, 
	sebastian.fricke@collabora.com, shawnguo@kernel.org,
 ulf.hansson@linaro.org, 	s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, 	linux-imx@nxp.com, l.stach@pengutronix.de,
 Frank.li@nxp.com, peng.fan@nxp.com, 	eagle.zhou@nxp.com,
 imx@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Tue, 02 Dec 2025 15:57:43 -0500
In-Reply-To: <570d444a92b0e49a11379cabc8f7f838e5228f7a.camel@ndufresne.ca>
References: <20251128025117.535-1-ming.qian@oss.nxp.com>
		 <20251128025117.535-2-ming.qian@oss.nxp.com>
		 <46e9a5a881946d879d1b2af3421d574b26256ae3.camel@ndufresne.ca>
		 <64ad3d66-4edf-4a0b-8992-0db0e90a32b0@oss.nxp.com>
	 <570d444a92b0e49a11379cabc8f7f838e5228f7a.camel@ndufresne.ca>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-oeGhnW9f2dXU8J1rQfXU"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-oeGhnW9f2dXU8J1rQfXU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 02 d=C3=A9cembre 2025 =C3=A0 15:21 -0500, Nicolas Dufresne a =C3=
=A9crit=C2=A0:
> Hi Ming,
>=20
> Le lundi 01 d=C3=A9cembre 2025 =C3=A0 09:52 +0800, Ming Qian(OSS) a =C3=
=A9crit=C2=A0:
> > > Then instead of this, I would like to add a kref to v4l2_m2m_dec, I c=
hecked
> > > already and this is both safe and backward compatible.
> > >=20
> > > Then in the get function, you will walk over the compatible that are
> > > different
> > > from the currently probe node. If you find one that is initialized, y=
ou will
> > > call v4l2_m2m_get() to obtained a shared reference. In _remove() you =
will
> > > simply
> > > do v4l2_m2m_put() instead of v4l2_m2m_release().
> > >=20
> > > Hope the others are happy with this. For Hantro drivers, this will ma=
ke it a
> > > much more powerfull mechanism.
> > >=20
> > > Nicolas
> > >=20
> >=20
> > For v4l2_m2m_get() and v4l2_m2m_put(), do you mean defining these two
> > functions in v4l2 m2m, instead of just adding them in the hantro driver=
?
>=20
> my idea was to add a kref to be able to share v4l2_m2m_dev. One thing I n=
otice
> is that its the v4l2_m2m dev that creates the media controller on all oth=
er
> drivers. Note sure why Hantro does it own still, maybe it predates, maybe=
 its
> something else.
>=20
> Its quite weirdly glued together, since the v4l2_m2m_release() function j=
ust
> happily free the m2m_dev without even trying to cleanup the media control=
ler. It
> totally orthogonal to the job queue, maybe it shouldn't be there.
>=20
> I'll make an RFC for the kref anyway, if that has a change, I'll try and =
split
> out the v4l2_m2m_mc_dev on it own, so driver can share a m2m and use the
> helpers.
>=20
> Nicolas

Here's down below what I had in mind, this is for illustration. I can send =
a
proper RFC, while at it I will move the media controller part out and port
Hantro to use the helper.

The idea is that instead of using global, you can have a list of devices th=
at
must be combined in the Hantro variant. You then walk the nodes, and if you=
 find
a match, you reference the v4l2_m2m_dev, isntead of creating a new one.

This is slightly more elegant, and can be reused quickly later if we have o=
ther
hantro complications like this. One use case could be for modern integratio=
n of
the Nano decoder/encoder combo (H1/G1 combo). These are known to share the =
same
internal SRAM, and cannot be run concurrently. This was defined as a single
device node on RK3588, but I think this badly describe the hardware, and ha=
ving
two nodes would be more clear.

A bonus would be to describe this dependency in the DT, but since this is
invisible hardware, its pretty hard to design. And in the case of imx8mq, i=
ts
not clear this was by design, but likely more an errata that should be adde=
d to
the pretty long list for this SoC.

cheers,
Nicolas

---
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date: Tue, 2 Dec 2025 15:40:37 -0500
Subject: [PATCH] media: v4l2-mem2mem: Add a kref to the v4l2_m2m_dev struct=
ure

Adding a reference count to the v4l2_m2m_dev structure allow safely sharing=
 it
across multiple hardware nodes. This can be used to prevent running jobs
concurrently on m2m cores that have some internal resource sharing.

Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 22 ++++++++++++++++++++++
 include/media/v4l2-mem2mem.h           | 21 +++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-co=
re/v4l2-mem2mem.c
index fec93c1a92317..b6940bab641d3 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -90,6 +90,7 @@ static const char * const m2m_entity_name[] =3D {
  * @job_work:		worker to run queued jobs.
  * @job_queue_flags:	flags of the queue status, %QUEUE_PAUSED.
  * @m2m_ops:		driver callbacks
+ * @kref:		device reference count
  */
 struct v4l2_m2m_dev {
 	struct v4l2_m2m_ctx	*curr_ctx;
@@ -109,6 +110,8 @@ struct v4l2_m2m_dev {
 	unsigned long		job_queue_flags;
=20
 	const struct v4l2_m2m_ops *m2m_ops;
+
+	struct kref kref;
 };
=20
 static struct v4l2_m2m_queue_ctx *get_queue_ctx(struct v4l2_m2m_ctx *m2m_c=
tx,
@@ -1200,6 +1203,7 @@ struct v4l2_m2m_dev *v4l2_m2m_init(const struct v4l2_=
m2m_ops *m2m_ops)
 	INIT_LIST_HEAD(&m2m_dev->job_queue);
 	spin_lock_init(&m2m_dev->job_spinlock);
 	INIT_WORK(&m2m_dev->job_work, v4l2_m2m_device_run_work);
+	kref_init(&m2m_dev->kref);
=20
 	return m2m_dev;
 }
@@ -1211,6 +1215,24 @@ void v4l2_m2m_release(struct v4l2_m2m_dev *m2m_dev)
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_release);
=20
+void v4l2_m2m_get(struct v4l2_m2m_dev *m2m_dev)
+{
+	kref_get(&m2m_dev->kref);
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_get);
+
+static void v4l2_m2m_release_from_kref(struct kref *kref)
+{
+	struct v4l2_m2m_dev *m2m_dev =3D container_of(kref, struct v4l2_m2m_dev, =
kref);
+	v4l2_m2m_release(m2m_dev);
+}
+
+void v4l2_m2m_put(struct v4l2_m2m_dev *m2m_dev)
+{
+	kref_put(&m2m_dev->kref, v4l2_m2m_release_from_kref);
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_put);
+
 struct v4l2_m2m_ctx *v4l2_m2m_ctx_init(struct v4l2_m2m_dev *m2m_dev,
 		void *drv_priv,
 		int (*queue_init)(void *priv, struct vb2_queue *src_vq, struct vb2_queue=
 *dst_vq))
diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
index bf6a09a04dcf8..ca295c660c7f9 100644
--- a/include/media/v4l2-mem2mem.h
+++ b/include/media/v4l2-mem2mem.h
@@ -547,6 +547,27 @@ v4l2_m2m_register_media_controller(struct v4l2_m2m_dev=
 *m2m_dev,
  */
 void v4l2_m2m_release(struct v4l2_m2m_dev *m2m_dev);
=20
+/**
+ * v4l2_m2m_get() - take a reference to the m2m_dev structure
+ *
+ * @m2m_dev: opaque pointer to the internal data to handle M2M context
+ *
+ * This is used to share the M2M device across multiple devices. This
+ * can be used to avoid scheduling two hardware nodes concurrently.
+ */
+void v4l2_m2m_get(struct v4l2_m2m_dev *m2m_dev);
+
+/**
+ * v4l2_m2m_put() - remove a reference to the m2m_dev structure
+ *
+ * @m2m_dev: opaque pointer to the internal data to handle M2M context
+ *
+ * Once the M2M device have no more references, v4l2_m2m_realse() will be
+ * called automatically. Users of this method should never call
+ * v4l2_m2m_release() directly. See v4l2_m2m_get() for more details.
+ */
+void v4l2_m2m_put(struct v4l2_m2m_dev *m2m_dev);
+
 /**
  * v4l2_m2m_ctx_init() - allocate and initialize a m2m context
  *
--=20
2.51.0

--=-oeGhnW9f2dXU8J1rQfXU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaS9SxwAKCRDZQZRRKWBy
9AnaAP4y7wj7aebAntWZrb2wnCjC7QWlt3m4ogUZ3VlHXqHfIwEA1LmIwtRQrb/4
XdFmnCvtP8Ujqe3jsNXbqxvAjjxZvgY=
=0jOP
-----END PGP SIGNATURE-----

--=-oeGhnW9f2dXU8J1rQfXU--
