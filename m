Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009391;
	b=uki4XRe777LyjjEXXEyv5GqymfQP+kQIXJLV0boLn280i/lt4qu+7YiyM36++NUg6zNC
	 HOevBFTTbFFCA/93wPoQx2vbCAdoiw8LkPBHyYDWL8c75ryNbqBXBkyB990BWqEc8IeuY
	 KhK5e95ZEPVIdvXYmaFgI5xII/lbfxD/V+XXdIxLYsN1Yi9NhHEljEAq6dAa7hb8tk1xO
	 AHkpmkRY0zCJxNHnTo9AAio0foFYBHb1NKj3Ru5FBsuTuTeXvJWNlzxX0FsuStgwema1E
	 8bchSnEjZzSwdVHFE8S+feZHhQmS7ym1NPNd9ix8qkbmmO33gqmLh66OuEycGXOrskw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=DA1a6/jz2LWscq7d/CNTikpsrr1vkgOPB56H0ypHpFU=;
	b=v5lGaVAKHLtLow5M9eZVxJhIYlkfWgKtiOM5VemiEwyoNGeMzRlyZjk789PZBlRTbFa7
	 BNNcdngr1Lv1jgJOmIr58aNdWkGE2P6gpBTipZOAMEcb5mWByVnNMdw6mOimjYCUtQ4up
	 d3iIf4kQ8lVAsa0kPYqNjQAMVsQ/US49eUibKf4c4zLC8bdBjRkM49wvugfytwnlwVfn+
	 8+KUdytqSILsAFAnBhV+xOmoL+mBw+HkBsgkoJQ6TriVjBZBWR1U50qmBAit2kfVjSAGx
	 CgBVuwFrIfW2YQHcyvwMDAKNT1Mh5byA7423RHEmiY1IdGoxJavmdVC5G/7eOBjh20g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UJl8dh09;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E191760A2600
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 10:09:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E191760A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UJl8dh09
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so26461665e9.2
        for <imx@lists.linux.dev>; Mon, 26 Oct 2026 03:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793009389; x=1793614189; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DA1a6/jz2LWscq7d/CNTikpsrr1vkgOPB56H0ypHpFU=;
        b=UJl8dh09t6otrlgYhj4gBp2Z49H4b0wwQVYWrLfRI/l+puGboYgyw6fwkSIzUZIiS3
         8LkcJJ1WZMyusEWSfs1F5kaTCPoP/pPiAk4fvD0ekfUFiP/C+UhR/pOSrHCtEOvocXdO
         QZG8F4tAKCKQhHn95ac7+FZgvIG/1CSJUwixvcLgF+gY3gD22jAqxxHN78oCUPs45l3s
         s8c8nRJe1myHOnebqJ3Kjzrrg7aSmlw7NAfYp9I9ruXiyzgUyF7Ey3jI5/sQr3ea+Z59
         M8JdMjb+ePFMcKO5Z12X3LAIDhoMZ3odfQXSDi3OUafMvuv5VpjhJoP+ietu63DLgmrK
         HY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009389; x=1793614189;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DA1a6/jz2LWscq7d/CNTikpsrr1vkgOPB56H0ypHpFU=;
        b=xPy3gPn2euiIlSrwVVkDTs5zPYFgE7YiYT2EU3ERRB129L7x3xp1dNiybJsTI4I+9S
         4YalELr+g37Lw4jkZfJGVOHAOS7jgN8L9Y1FI1uBIdB/NiLqzRNCgf8IUOd5JJ4aE+xy
         8LHItz8eEOVijfG0GzKRrnHtE/GJJ9hf38xYytaYOQM3mJI2GRw179MWdWfcIfMcrsU0
         la/fZwwkjEQRZDdTKYCM8edn5Qxd7GCm0fvvVj6XMRn1howwdl2bB7VMeHNqsrBekxBh
         niv0p7J7u9BSh9FGfnMPfnegNvEnsM/E7sUodciw1QomAwMnXgvr912tCqcjDuDsPcoE
         nteA==
X-Forwarded-Encrypted: i=1; AKwUvBwsTdfSNB8zmMz4jEIJL2siTunp1S+59sV96gl1WDmvx6IJR6Xw/pgmrPbpWVndnjnirqQ=@lists.linux.dev
X-Gm-Message-State: AFq9FYJLDVEpwp4vC0So3dtZrkiV0S8XYjE6RVdZpq8oomltFeBUCSYC
	CuGEJPiCLy1+0GXvntPhg7TtwPZHM8WMiWuoLAOdY4dyJkTJQkormoG0/zugkr03UAs=
X-Gm-Gg: AYBFou3MZlJYm7vQkSi2tu/dvsMOQqnnukF9Q0PYhjenCXvRbCQGlqSNtfs46mlrwrr
	s+NNIMYWfwiU10FbRZmiay9qbwXEosQ/Fp/lavEhzsD7f/dSZ0ER4m7DhrgWpYd0Y+sWLNjw3O5
	l9irxOq7T4Lk5BqP/pq6JF+8dPOVUx2SzJVwcQMzgUW2Uy1o28PIgW+Jbk61P8TYsdHn2UlhDFO
	931a/tHfBQOquXXe9/Nv3PNMivQzijPEe2xgecaq1i1t6UmWtdDWKmS4lsFhapFF1FSTCgyniNU
	NfQzlDsEemsY+nWpaugC9d5nmg+1BrRwArdZGS4iih+rD/YNbfwFtkl52V6JetxI6rdiFleM6PL
	SB1L9+bmYwja2zyprXUGCTK4j3Fh+7rneJDzmQnvoagl8G7HSC2SYVnM+eKpQkzfsdEZ5Rc0tNC
	Xs2Bm6g8c96ZXHi+epH/fLlUCwYVL2ByVxsSud9g6a074CzF45oRnAD/+nhNr93sGQtB60hRwfV
	Z95Gpw+7mv4p1sGRGm5Dh2vXaZwOaQTfiNl8qEeu6WSRoaKp1mJGnxoBSXeDA+PncfmkYOWsMKK
	xF4WP4VbhozO7jbcsrbdIMAP4KmpmCtWBQuaOlNhex+wVUjqQW7eofcV7GRsFmn/
X-Received: by 2002:a05:600c:1987:b0:4a1:db17:c7e6 with SMTP id 5b1f17b1804b1-4a35ac3a7b1mr105329285e9.2.1793009389330;
        Mon, 26 Oct 2026 03:09:49 -0700 (PDT)
Received: from localhost (p200300f65f19a904bf765b6740c3076b.dip0.t-ipconnect.de. [2003:f6:5f19:a904:bf76:5b67:40c3:76b])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ebc3bdbsm12723417f8f.19.2026.10.26.03.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:09:48 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] remoteproc: imx_dsp_rproc: Implement .memcpy_tova()
Date: Mon, 26 Oct 2026 11:09:31 +0100
Message-ID:  <951ff0c2bad8709b77b5ac7086b70cc7d37ce51c.1793008847.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793008847.git.u.kleine-koenig@baylibre.com>
References: <cover.1793008847.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5255; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=hxruU5Qpi7r2EJrNeBqarI1YguCnlDks2WjPOZVNhtc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq3ybhCmBylIiFeQF6JYkVphxgdtR4trriGdeKV WyMVHE5hfGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat8m4QAKCRCPgPtYfRL+ TqZQB/469uqHF0RQ3p1EtU5kkJhZgfZbqHOiHj9dcj/QjmbMJRgCsw+/wIgRYW0IRiO/++pMNVX 2sQYzZnumvdt3pS9qoAvqTO+EdxGaFirLJxoABx1CDduUP1JpAsbpKaYNyEoJqt+5lQh3TMQcMq DlM1PL/u9DAx7b54WXxvPhB6vOWX0eptEk7qYWjz8vQ9Q4g2gmHL2RQKwWGE0GZ1yweUJQmCn+K qyD+Vbdi7el6bO9pv5+VP2gX9rLg+BFoCH2h2iQxTfeaCOXBqThL5xuza0JA19i0j+J+li58Fr7 TlwpNM4Dn/jozhd/xBFmZTToNdVIK2FJRuURwqTWCZtgSzTh
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

This callback allows to use the core's rproc_elf_load_segments()
function instead of reimplementing it for very minor changes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 120 ++++++++---------------------
 1 file changed, 30 insertions(+), 90 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 96d619daf3f5..324c10f18507 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -864,97 +864,41 @@ static int imx_dsp_rproc_memset(void *addr, u8 value, size_t size)
 	return 0;
 }
 
-/*
- * imx_dsp_rproc_elf_load_segments() - load firmware segments to memory
- * @rproc: remote processor which will be booted using these fw segments
- * @fw: the ELF firmware image
- *
- * This function loads the firmware segments to memory, where the remote
- * processor expects them.
- *
- * Return: 0 on success and an appropriate error code otherwise
- */
-static int imx_dsp_rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
+static int imx_dsp_rproc_memcpy_tova(struct rproc *rproc, u64 da, const void *src,
+				     size_t filesz, size_t memsz)
 {
 	struct device *dev = &rproc->dev;
-	const void *ehdr, *phdr;
-	int i, ret = 0;
-	u16 phnum;
-	const u8 *elf_data = fw->data;
-	u8 class = fw_elf_get_class(fw);
-	u32 elf_phdr_get_size = elf_size_of_phdr(class);
+	void *ptr;
+	int ret;
 
-	ehdr = elf_data;
-	phnum = elf_hdr_get_e_phnum(class, ehdr);
-	phdr = elf_data + elf_hdr_get_e_phoff(class, ehdr);
+	/* grab the kernel address for this device address */
+	ptr = rproc_da_to_va(rproc, da, memsz, NULL);
+	if (!ptr) {
+		dev_err(dev, "bad phdr da 0x%llx mem 0x%zx\n", da, memsz);
+		return -EINVAL;
+	}
 
-	/* go through the available ELF segments */
-	for (i = 0; i < phnum; i++, phdr += elf_phdr_get_size) {
-		u64 da = elf_phdr_get_p_paddr(class, phdr);
-		u64 memsz = elf_phdr_get_p_memsz(class, phdr);
-		u64 filesz = elf_phdr_get_p_filesz(class, phdr);
-		u64 offset = elf_phdr_get_p_offset(class, phdr);
-		u32 type = elf_phdr_get_p_type(class, phdr);
-		void *ptr;
-
-		if (type != PT_LOAD || !memsz)
-			continue;
-
-		dev_dbg(dev, "phdr: type %d da 0x%llx memsz 0x%llx filesz 0x%llx\n",
-			type, da, memsz, filesz);
-
-		if (filesz > memsz) {
-			dev_err(dev, "bad phdr filesz 0x%llx memsz 0x%llx\n",
-				filesz, memsz);
-			ret = -EINVAL;
-			break;
-		}
-
-		if (offset + filesz > fw->size) {
-			dev_err(dev, "truncated fw: need 0x%llx avail 0x%zx\n",
-				offset + filesz, fw->size);
-			ret = -EINVAL;
-			break;
-		}
-
-		if (!rproc_u64_fit_in_size_t(memsz)) {
-			dev_err(dev, "size (%llx) does not fit in size_t type\n",
-				memsz);
-			ret = -EOVERFLOW;
-			break;
-		}
-
-		/* grab the kernel address for this device address */
-		ptr = rproc_da_to_va(rproc, da, memsz, NULL);
-		if (!ptr) {
-			dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
-				memsz);
-			ret = -EINVAL;
-			break;
-		}
-
-		/* put the segment where the remote processor expects it */
-		if (filesz) {
-			ret = imx_dsp_rproc_memcpy(ptr, elf_data + offset, filesz);
-			if (ret) {
-				dev_err(dev, "memory copy failed for da 0x%llx memsz 0x%llx\n",
-					da, memsz);
-				break;
-			}
-		}
-
-		/* zero out remaining memory for this segment */
-		if (memsz > filesz) {
-			ret = imx_dsp_rproc_memset(ptr + filesz, 0, memsz - filesz);
-			if (ret) {
-				dev_err(dev, "memset failed for da 0x%llx memsz 0x%llx\n",
-					da, memsz);
-				break;
-			}
+	/* put the segment where the remote processor expects it */
+	if (filesz) {
+		ret = imx_dsp_rproc_memcpy(ptr, src, filesz);
+		if (ret) {
+			dev_err(dev, "memory copy failed for da 0x%llx memsz 0x%zx\n",
+				da, memsz);
+			return ret;
 		}
 	}
 
-	return ret;
+	/* zero out remaining memory for this segment */
+	if (memsz > filesz) {
+		ret = imx_dsp_rproc_memset(ptr + filesz, 0, memsz - filesz);
+		if (ret) {
+			dev_err(dev, "memset failed for da 0x%llx memsz 0x%zx\n",
+				da, memsz);
+			return ret;
+		}
+	}
+
+	return 0;
 }
 
 static int imx_dsp_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
@@ -969,7 +913,6 @@ static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware *fw)
 	struct imx_dsp_rproc *priv = rproc->priv;
 	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
 	struct rproc_mem_entry *carveout;
-	int ret;
 
 	/* Reset DSP if needed */
 	if (dsp_dcfg->reset)
@@ -985,11 +928,7 @@ static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware *fw)
 		}
 	}
 
-	ret = imx_dsp_rproc_elf_load_segments(rproc, fw);
-	if (ret)
-		return ret;
-
-	return 0;
+	return rproc_elf_load_segments(rproc, fw);
 }
 
 static const struct rproc_ops imx_dsp_rproc_ops = {
@@ -998,6 +937,7 @@ static const struct rproc_ops imx_dsp_rproc_ops = {
 	.start		= imx_dsp_rproc_start,
 	.stop		= imx_dsp_rproc_stop,
 	.kick		= imx_dsp_rproc_kick,
+	.memcpy_tova	= imx_dsp_rproc_memcpy_tova,
 	.load		= imx_dsp_rproc_load,
 	.parse_fw	= imx_dsp_rproc_parse_fw,
 	.handle_rsc	= imx_dsp_rproc_handle_rsc,
-- 
2.47.3

