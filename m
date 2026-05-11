Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821A73BB9F1
	for <imx@lists.linux.dev>; Mon, 11 May 2026 09:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778490694; cv=none; b=QOBtKSV6+93k6M3dJOlhBDC1xAw0OnufqEuTfKcniGIq5O/XtE825azKMJL/mdfRfeW8Hf9rLEnqc41YEgCrfw0YKUYgPbMOdVG6YWFB8HGjjS7kiTM8h8VlWCr0Dgc/R9o/gkNR2kzheJllqfNSTGFiY2cmYKZ98TgBVSvc8nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778490694; c=relaxed/simple;
	bh=2Fbe+51I+NHaqoJEm/Ia1P/RkOrsQ8sOHQ84+D4jX5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R/kFBeYUPILfjeNTq4Yt57oeQPA+j6d9HQ25YK9AUceLTgQgijl9YdxtpxOARLDhanjbV+AtLAhMdbVcYCzAN2ccysBRmCWDJTI6rq9fpgvWP1k1Xy9DCfDlswKqY9jLVY+mVQZAbk6Kja9GnlstcsgpEyjYtU1JpKrdrCW02is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TnLvD6Hq; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TnLvD6Hq"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-83d5bbef760so1106781b3a.1
        for <imx@lists.linux.dev>; Mon, 11 May 2026 02:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778490693; x=1779095493; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrmu7Ax8Tjv7DXY7cz3wQn6QU0gYid8cSWvbdHALi/M=;
        b=TnLvD6Hqf1sSlVO2mwcgUhE4V6sIQSnyIsGgEm/FqhJ/FHaCdq2+XbOd3kn2ECvoy9
         XoaIzq/uMdrhcPLC8kOwZo7xwiuSRLH/Ok/yN7Z05tM+78rm807DX4kp6ArlEIoxkrA5
         nhG1RVwKudZ7zaUgJyvqKoakDSQhic4wKJ5aRwlLHRhDiJInrr21fGi9dojB5CLiTN5/
         RSUSkXu9L315wibRNlmb9Ep/y7ZewI+iQyabYyv8O+9Iel4xV4cuqnaHEUb1yxzUNxvH
         RBIxs+VLbs/0s21gII8oRBlg+/c/K7TOYBSNUci8CqVpZGCocmycbguKMRiSqC3k8s3r
         J4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778490693; x=1779095493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mrmu7Ax8Tjv7DXY7cz3wQn6QU0gYid8cSWvbdHALi/M=;
        b=FJ34rLBUKUwreK8BbOjKkciuqcxFiABeieuzDfmmSwMHSkg4p2CaUXXKFeRO8PFzaM
         IebSIqCkxbomWQQo6wM4RoWR75Tt2N1JLds8w6jcNteBxw0n+OTiMF2rUWBttJtTnOWc
         mpvw8B01K3ltfCwCo+ZsZHBJrtVapgihDJqGrYkr8/BoqNX5e4muJhGdvpE7MKbq0zmh
         /F1Y5ouAa7SxyjrISWOIqYjSQ6S/N9EYSsvpBuCEhocKdG1XcMqvzK0V6rGLnbmMC6af
         T1BCcWhd2aOrLQgyxvQtuMr7j4KQa40V7bDVS43Df3G+Oc/Y/CNuDZlhVmyCDU0fpYuj
         27Xw==
X-Forwarded-Encrypted: i=1; AFNElJ+9R8TDEWTpXMmC0U6dBERab3Ff726HJG09DVd+Yhr3fosi9HaqN4O/cdO1WZDDnW8ycBw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwVjJ1W96LJpe2elEjrQr9WLRtvEn4onFyhwPjNSz/wajIHguB3
	qKwLXgnH4mSoA85wyIvWAWPr5CySn8OL278/GaQCltRauMA65ihZ8n+D
X-Gm-Gg: Acq92OGoVYjgM3szpdmiTRphF46jHtmWOMraTSYgzACskQmoIAtbvzrc2XfO28+Sag9
	505DtGcDbMmbLt/DxfrcMZUemJKXuReNa1xy62YKpgY391n+Tt1U5rladcH2tF79hxsd0o8bpxq
	Jeu4oIrMMCpSuYJsP1oC4C2qfdMZIFeLfxoXT2SnNfFzMF3WrCYYV3mKZbt5TIzxFMicSSPk8Fn
	nJ7Dmt8KkBV1oBFuNAB+Yl83suAmvS42z+Xr64T1dfLhaNnRsemqW+3RGdVH16se86lnrf9YTZp
	wuXg4c7jOfFVsSpCoWK1gSOLltwqJS85X4kw5hGRoWKEhqG/CMignk7XrLsOUGEZNX+R7fhIshN
	NhlNakOx5lipEqIuDbx4k7MzyoVT9y4vzUsZlRtYsm76yBpOSGYWS9tv34yUEmEeIyCLPz+wnwC
	D65DCFLb4nkCaIyuSZGe0UMLA=
X-Received: by 2002:a05:6a20:3ca5:b0:3a1:d516:36ec with SMTP id adf61e73a8af0-3aa5ad31592mr26172526637.56.1778490692746;
        Mon, 11 May 2026 02:11:32 -0700 (PDT)
Received: from nuvole ([2409:8a34:5f37:1974:abc5:99cd:a924:4e86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f11csm24775517b3a.3.2026.05.11.02.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 02:11:32 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v3 1/5] media: hi846: fix hi846_write_reg_16 handling
Date: Mon, 11 May 2026 17:09:20 +0800
Message-ID: <20260511090924.269106-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511090924.269106-1-mitltlatltl@gmail.com>
References: <20260511090924.269106-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hi846_write_reg_16() does not clear a positive *err value on success.
pm_runtime_get_if_in_use() returns a positive value when the device
is already in use. When hi846_set_ctrl() passes &ret holding this
positive value) to hi846_write_reg_16(), the function returns with ret
as is, the positive value propagates back as a return code, which
callers interpret as an error.

Fix this by resetting *err to 0 only when it is positive.

Fixes: 04fc06f6dc15 ("media: hi846: fix usage of pm_runtime_get_if_in_use()")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/media/i2c/hi846.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index a3f77b8434ca..7f069aca0fce 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1271,6 +1271,8 @@ static void hi846_write_reg_16(struct hi846 *hi846, u16 reg, u16 val, int *err)
 	if (*err < 0)
 		return;
 
+	*err = 0;
+
 	put_unaligned_be16(reg, buf);
 	put_unaligned_be16(val, buf + 2);
 	ret = i2c_master_send(client, buf, sizeof(buf));
-- 
2.54.0

