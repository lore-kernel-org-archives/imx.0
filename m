Received: from mxc.seznam.cz (mxc.seznam.cz [77.75.79.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9951D5CC1
	for <imx@lists.linux.dev>; Fri, 13 Sep 2024 09:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.75.79.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726219101; cv=none; b=XtzmvRB0H8GGApKKAsVzyiYRCmo+ybhR7PRHjLspEWU07ITc44hJKInuuWlYGOmVzYarFbirwbDM1arq91hh6vXmd9QfIL4XQVavCTpP8AT45aeIxrv5fE+CneJqA7femFYzDeRPvKhlM8PmkWwuZuBozbafexcPw5F4v8/VFeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726219101; c=relaxed/simple;
	bh=MhYpjZsHGerh9uV9YInezLCAzgBvKjuo7JrUHX1GgMs=;
	h=From:To:Cc:Subject:Date:Message-Id:Mime-Version:Content-Type; b=BIdPkzClwuQas7Rxb0WLcDMHOKxJlp/qV0fpRQTx4AuVlMGGzchCd0ySl3AYVmqtnoZ6A1ie/uXG4+yQuqiO1Ka6zRuSN1P1OMQXZEkQYhUNuernLyF6yeolqtqK0tVTTnRXAcClWtC4gH0PlUBWgDEWDywMkrsdkI4uqWpLBjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=email.cz; spf=pass smtp.mailfrom=email.cz; dkim=pass (2048-bit key) header.d=email.cz header.i=@email.cz header.b=yHRNkcyD; arc=none smtp.client-ip=77.75.79.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=email.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=email.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=email.cz header.i=@email.cz header.b="yHRNkcyD"
Received: from email.seznam.cz
	by smtpc-mxc-5dcf9c4c56-7mmgn
	(smtpc-mxc-5dcf9c4c56-7mmgn [2a02:598:64:8a00::1000:9c1])
	id 125c872aeca8358012d20932;
	Fri, 13 Sep 2024 11:16:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz;
	s=szn20221014; t=1726218996;
	bh=g4vwlwy5O7TMlld+y4YtQP4hezQIvov6mjtXb2jroRk=;
	h=Received:From:To:Cc:Subject:Date:Message-Id:Mime-Version:X-Mailer:
	 Content-Type:Content-Transfer-Encoding;
	b=yHRNkcyDZ/b587JuWLm9zuZUsWNxdpvmmt5OevLjhgBeqMmveyIQDTrHKWHq4GzCU
	 d71W8KQTKuZ/noPSvSEfJUo/6gp5dwCBxoeXD9Hg2VyZMJJre7uNTEBqbvf4SKp5n3
	 Kq47sLjCnxYeb/eBkN+bh70TMjvgpJvCEGFtXGmnek0kcPWVif1PmVqFyu7+NoHj/5
	 11EnCUXedOEUkXu+I8XLgblI3fVcSoX559O89fxtG2TwN3mIqAkykr5TWBSJr9zKWM
	 NmQXiUvbaGjrA2SExcDuRUHyMxjXsui1lrhjkTk7SLDHZg9uM6m6FmY2WRkRjT0g7v
	 Zx9nEWYZP+7RA==
Received: from 184-143.ktuo.cz (184-143.ktuo.cz [82.144.143.184])
	by email.seznam.cz (szn-ebox-5.0.189) with HTTP;
	Fri, 13 Sep 2024 11:11:43 +0200 (CEST)
From: "Tomas Paukrt" <tomaspaukrt@email.cz>
To: <linux-crypto@vger.kernel.org>
Cc: "Herbert Xu" <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	"Shawn Guo" <shawnguo@kernel.org>,
	"Sascha Hauer" <s.hauer@pengutronix.de>,
	"Pengutronix Kernel Team" <kernel@pengutronix.de>,
	"Fabio Estevam" <festevam@gmail.com>,
	<imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] crypto: mxs-dcp: Fix AES-CBC with hardware-bound keys
Date: Fri, 13 Sep 2024 11:11:43 +0200 (CEST)
Message-Id: <1Wx.Zci3.5c7{vqn25ku.1cv07F@seznam.cz>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (szn-mime-2.1.61)
X-Mailer: szn-ebox-5.0.189
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Fix passing an initialization vector in the payload field which
is necessary for AES in CBC mode even with hardware-bound keys.

Fixes: 3d16af0b4cfa ("crypto: mxs-dcp: Add support for hardware-bound keys=
")
Signed-off-by: Tomas Paukrt <tomaspaukrt@email.cz>
---
 drivers/crypto/mxs-dcp.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/crypto/mxs-dcp.c b/drivers/crypto/mxs-dcp.c
index c82775d..77a6301 100644
--- a/drivers/crypto/mxs-dcp.c
+++ b/drivers/crypto/mxs-dcp.c
@@ -225,21 +225,22 @@ static int mxs_dcp_start_dma(struct dcp_async_ctx *a=
ctx)
 static int mxs_dcp_run_aes(struct dcp_async_ctx *actx,
 			   struct skcipher_request *req, int init)
 {
-	dma_addr_t key_phys =3D 0;
-	dma_addr_t src_phys, dst_phys;
+	dma_addr_t key_phys, src_phys, dst_phys;
 	struct dcp *sdcp =3D global_sdcp;
 	struct dcp_dma_desc *desc =3D &sdcp->coh->desc[actx->chan];
 	struct dcp_aes_req_ctx *rctx =3D skcipher_request_ctx(req);
 	bool key_referenced =3D actx->key_referenced;
 	int ret;
 
-	if (!key_referenced) {
+	if (key_referenced)
+		key_phys =3D dma_map_single(sdcp->dev, sdcp->coh->aes_key + AES_KEYSIZE=
_128,
+					  AES_KEYSIZE_128, DMA_TO_DEVICE);
+	else
 		key_phys =3D dma_map_single(sdcp->dev, sdcp->coh->aes_key,
 					  2 * AES_KEYSIZE_128, DMA_TO_DEVICE);
-		ret =3D dma_mapping_error(sdcp->dev, key_phys);
-		if (ret)
-			return ret;
-	}
+	ret =3D dma_mapping_error(sdcp->dev, key_phys);
+	if (ret)
+		return ret;
 
 	src_phys =3D dma_map_single(sdcp->dev, sdcp->coh->aes_in_buf,
 				  DCP_BUF_SZ, DMA_TO_DEVICE);
@@ -300,7 +301,10 @@ static int mxs_dcp_run_aes(struct dcp_async_ctx *actx=
,
 err_dst:
 	dma_unmap_single(sdcp->dev, src_phys, DCP_BUF_SZ, DMA_TO_DEVICE);
 err_src:
-	if (!key_referenced)
+	if (key_referenced)
+		dma_unmap_single(sdcp->dev, key_phys, AES_KEYSIZE_128,
+				 DMA_TO_DEVICE);
+	else
 		dma_unmap_single(sdcp->dev, key_phys, 2 * AES_KEYSIZE_128,
 				 DMA_TO_DEVICE);
 	return ret;
-- 
2.7.4
 
