Received: from mail-108-mta50.mxroute.com (mail-108-mta50.mxroute.com [136.175.108.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B03C130499
	for <imx@lists.linux.dev>; Wed,  1 May 2024 15:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714577458; cv=none; b=BSTUyqftAoKfIzKZC4487uuv/vS65GJzB98yBna5ilr5LWL7/Qy2Q9AtFxZjXhpUTSOGkYIJtYCfdLJMONITaKaW8LSWphynxtcYzMi6vDi3iDsG7IIo8MdjS9vHmw3omPAL1ZyBUb/XIatV4mjuss54mFgTdkLPcYGKh+1dR2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714577458; c=relaxed/simple;
	bh=cuxeD9nspba5A5YYP0u3xeWbqdSoqR0pPllRyYusAi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eur2jLNJRpBgY4ku8OW18Y/7WTPaZUXRO+9P37aMVlR57hbHxCLui/xrNKXRver2/UgA7SvzV5sj2us94XQ4YcBPPXZG7yn49ZQBbN6SFLxFJKJcWmsjf6OpKE9axNwYgoRdvsd4pAa4Tdh6rCtwSKIOJ3PuDYxcRi3eaP/aZcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=e3YpDVoS; arc=none smtp.client-ip=136.175.108.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="e3YpDVoS"
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta50.mxroute.com (ZoneMTA) with ESMTPSA id 18f34c2fc9c0008ca2.00b
 for <imx@lists.linux.dev>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 01 May 2024 15:25:44 +0000
X-Zone-Loop: 7cc7e6ad7bebabbfa05a68f6b52f92730880b6c4ef0b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Rj85ZDGBsJ3+/OmSU/Kn4T2SJ0OalVMVn4FMD/UJ3Qk=; b=e3YpDVoSQV2SUprQn29PFHkC+T
	R0+j87OkUk8I3BLbc1gxdki3ERCUVtpFeQJ00SmJqe4k82mN6cybzwZ2ERmQOI55XXopoX69eHi4f
	E+uyvpLishijbYS77kYsKjifadGkWy1rydn00sz0evTj4USA0S2i+WEA6TN1EsaMgIBwCoexjtpQQ
	1136WJbkia2s6eRGIcqyuNPIcXJxmwdc5rqI156t1K8MkYeZCagRgxfsnwF0vQ5enQvPHnkb+fpUS
	VaKAM0SBOxxNggf0/siOfg3+KaQ0bdLYczevPCwVbYXfwyDi7ZBPiAWlo9dyYNvcXuXtYwKP0akEz
	ylpODuOw==;
From: git@luigi311.com
To: linux-media@vger.kernel.org
Cc: dave.stevenson@raspberrypi.com,
	jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	sakari.ailus@linux.intel.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	pavel@ucw.cz,
	phone-devel@vger.kernel.org,
	Luis Garcia <git@luigi311.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>
Subject: [PATCH v5 24/25] media: i2c: imx258: Use v4l2_link_freq_to_bitmap helper
Date: Wed,  1 May 2024 09:24:41 -0600
Message-ID: <20240501152442.1072627-25-git@luigi311.com>
In-Reply-To: <20240501152442.1072627-1-git@luigi311.com>
References: <20240501152442.1072627-1-git@luigi311.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: personal@luigi311.com

From: Luis Garcia <git@luigi311.com>

Use the v4l2_link_freq_to_bitmap() helper to figure out which
driver-supported link freq can be used on a given system.

Signed-off-by: Luis Garcia <git@luigi311.com>
Reviewed-by: Pavel Machek <pavel@ucw.cz>
Reviewed-by: Tommaso Merciai <tomm.merciai@gmail.com>
---
 drivers/media/i2c/imx258.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 74a8f3ed1ab5..d7a1cc143bae 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -693,6 +693,7 @@ struct imx258 {
 	/* Current mode */
 	const struct imx258_mode *cur_mode;
 
+	unsigned long link_freq_bitmap;
 	const struct imx258_link_freq_config *link_freq_configs;
 	const s64 *link_freq_menu_items;
 	unsigned int lane_mode_idx;
@@ -1551,6 +1552,17 @@ static int imx258_probe(struct i2c_client *client)
 		return ret;
 	}
 
+	ret = v4l2_link_freq_to_bitmap(&client->dev,
+				       ep.link_frequencies,
+				       ep.nr_of_link_frequencies,
+				       imx258->link_freq_menu_items,
+				       ARRAY_SIZE(link_freq_menu_items_19_2),
+				       &imx258->link_freq_bitmap);
+	if (ret) {
+		dev_err(&client->dev, "Link frequency not supported\n");
+		goto error_endpoint_free;
+	}
+
 	/* Get number of data lanes */
 	switch (ep.bus.mipi_csi2.num_data_lanes) {
 	case 2:
-- 
2.44.0

