Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880006;
	b=lH5U+eb8iQ+HTTcXvgAhy2XwEiNgGpCHAgwRP00QhKLt3LrwQTDKpDrwSZMfsBcWCJ5D
	 GibdI8HBqyff35u9xwRcrN0z8RUhdN4W7KzIvLH9aOUZE+BmuGKmWdRMIX22sDR69Cvnf
	 C5EZjqhCMZu/1mxZmI1IjzfSrWXo48JrQCN/swcwQzAASP/z1HO3ymdERwV0gySMHUmI4
	 mdtZBtYNC7blMcUFMySTXGGYtQPQoQcfvHFxohSaKcyW1ZiljqU2u+r2tFABAJ8Yx6i+4
	 Ufy7h2hdKlkMhPWlUWWl34IFl7xxVZbkogN4BFtytdLEvs0xwJLq5qOa7Mi4UmGQcPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=GKhGMwWEaq+Cm90GvlNAnPOqyBlaMvPivUMvlM2FYLs=;
	b=gGPmYBL5cpouQsBsiHhg95kGyYXmwlyzT8LbobG+TufvA4qq0O2FktN0922Iby4IQqFG
	 TEt6FsUNl+3uB7hidN7f8x9NgX3kcLthXHc3tY6UYNHpKz3WvezsF48s/nVuvfdJ3ok0x
	 wlRxyttExUhL8QVGikX+sNGx375jYBGhb+3FHcjDgseCj5hQwVUMFytjLUxiHJzGek9k8
	 ZxuCMk69gVGtYEkLHrc7vUVaZUFeIgtewA/g22T1tE2vRcEPEn+9Vi5QVdpPWX61hE2od
	 2xFYzBuDpSa5+ZxwEPUX5DcaSfB8/r2nTeTU6ffRV66aNQeYwcNjHHA5vbzRwtAFM/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fkTt2awp;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DA1606A32F
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 12:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81DA1606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fkTt2awp
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4922523d1afso70369f8f.0
        for <imx@lists.linux.dev>; Thu, 05 Nov 2026 04:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793880003; x=1794484803; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GKhGMwWEaq+Cm90GvlNAnPOqyBlaMvPivUMvlM2FYLs=;
        b=fkTt2awpDLXpoAkAzaB6qqlnry8utIPP8hCBIMigq6XroExmMXXW5fSXNZ6Q0BcDwD
         wSmHuz0SxOqBcTGrIfOSgCxkjqkYvtQYTFswdFVio7icIUj/X7UP5+F//K/veON/NJcx
         pvcaj/IKPFi2qC9dQoX/NZ+8K3mlMqHt+bmWa5+BKBe49yxxLk9Tw0Z4V/6asJl9jRD9
         +A4JAQqMEw3a/l/5N2TSMCgSrtY+rAnUfEsLnAdRFiB4SDIWkqLeo78o0wrUJ/nNcp8+
         j6tQZzyOI7AMeL9mkWVdTfXn5IjY1AEubkyLcbZxgcWoe/RuKzNVlVICO2xUJAE3FvnJ
         XwLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880003; x=1794484803;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GKhGMwWEaq+Cm90GvlNAnPOqyBlaMvPivUMvlM2FYLs=;
        b=fjcQg4o7OfMPjW5H88e/0U1MI7zTlBTECU+vpfJ8FxIDO9fD05eZpoP48uGwRVyzKU
         4Zt06DRP9u7sFUuWbgghbPkIemPhDj46PpJsqe3kdCUUAOz8pu3718N9BDAZKykSyZpC
         NuZ+00H9PFOrnlBJ8j4AWcLNZ7aik7+Gw3BJ9ObqqMa+2wtPZE6p0xtSlEHycYfSyEKy
         m8e+vg6OgnW0HxkWbp/iAJPR97KD/zRAdDIdqGUmgKTRS5cvV+QoLTwt2zD0arKRHuwa
         TkC7VNQoXIJU32BE4oRn6Z9aKrRdP63GM176mFPViiB13Ik38uMETSwVViHtSSERN/bt
         K9eg==
X-Forwarded-Encrypted: i=1; AKwUvBzpW0bWhnftA9EodfuVSFuIfh52tMEKpUq2q5YsshoVP0UahW/VQQQnCiC0/o+Ccpp35aQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z/jtRYcfRx4KQq8ansL4IZgZnOozKg/+39cKQtDPJo5t1Ht/CTg
	GEkuQXWQ2t29wLdxm5UZ+5FsXsL4OfqbbQRRg99AOZp4YxBANqMqVuU0lsmMeU8DZeM=
X-Gm-Gg: AYBFou3Qlyyl/WnQMKwUSRCb45ZpVyVvmL7eX6E1KnyNVdRaYrOSoI59L5IywZm7S8p
	suTTypoPVTCY5gyA5CECGW2kqhIGRPFzhk5Ddidf+vxvwQcZ2hDSC4t5KipRQmQNdrQEIIM+naR
	zd0Ji5FoyuUAEgWqc9oBkVEicnuU6YEXxhShOOxbJYFWkrck6TDGEMeXw4bNbXLuX5g3qD/krSW
	aJxzFahzBXo2kTIav0pLYLy4dxHs5MfE4K66HNh5BZFLCyVG6HWKp535RUWbAfT0+vT93W0ZMAG
	Q70l/SNQUinVGZpCfApRlcfnGJ7YJaNSey3QEgYBGx/Dv46wYx0yx4KJZvdryMdB3rqzt1gxRGz
	62dd8kvGBEyZm1PsxeycjzEDlFC6E9lEtjGgJxOhfvMMcUUesKhARfeM6FLBpKSKh3jsJLXykGw
	6r4L1uoboUANQp8vtKJwXJo/CqHN/1Q8XVVUKswKq8IaeGtXst3JeqLrZqWgu5NfSMKn5TmLkRS
	tOrDgPJvFOr2CEkLQYIUSIBHqm6dhr8ccz6fcatymFOYtmMCsUI3747bSJ9o8ZSQl7JHKgJ2oMt
	+0KbGa9HYrLk5lMEKIQ6YIncvgceW46+CTWTZk6Em6JqnUq51iGyBnsNbazJtjHgtWtt2ci1pHb
	e4ODCte8XJi3WB3nl1OUjHnIziw9MQGYXzYia3g==
X-Received: by 2002:a05:6000:420d:b0:48e:7508:bc12 with SMTP id ffacd0b85a97d-48e7508bda2mr39449627f8f.10.1793880002818;
        Thu, 05 Nov 2026 04:00:02 -0800 (PST)
Received: from localhost (p200300f65f19a904ae40ca5165ccacb8.dip0.t-ipconnect.de. [2003:f6:5f19:a904:ae40:ca51:65cc:acb8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48fed0844c8sm10144620f8f.26.2026.11.05.04.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:00:01 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] remoteproc: elf_loader: Make rproc_elf_load_segments() more generic
Date: Thu,  5 Nov 2026 12:59:50 +0100
Message-ID: <cover.1793879714.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=962; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=dlFNL/7079gou5h3eVG+eT1NdVjDy6yo/xetSiy1KDM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq7G+3SGG2PzkTYN2mOS+nHHZ3aUUEdmY7PqhmN x13lV6S3UeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauxvtwAKCRCPgPtYfRL+ TlSHB/0f2zV3hLCeaFMGvDmHjdg+j/5IFlFy/1I9gbbilHoloWIuNSZHyN699/+LVlSTqcMhmHi n9XNY0tlZ53Ns0hV6OQmn8m8/cJwLakBd810iEvrbK+zdlETADziNCGWLAyvM934XqLrTqtU3kW LzpfX+f3IaFpGimPEKOrq2r27Xrjr9nh0PtVDsyDiyVioGU1QtBmpOd0fxLvn8Voo5tLFAhDtA1 khBgjXt4t5TUjT3lIFKJjvy3aA0uc+uQsuMK4c9mb204Po+VX7aPr3fqzD+s2HHBnJAhjOg08tW YsL7ATmoSG56BaAFNoziJWlL4i89uLFwls/klK8i7H4i/qbB
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

changes since v2 (available at
https://lore.kernel.org/linux-remoteproc/cover.1793117996.git.u.kleine-koenig@baylibre.com):

 - trivially rebase to next-20261104
 - update commit log of the first patch to justify the new callback
   working on the device address instead of a virtual address. The
   latter would work with imx_dsp_rproc, but on (not yet mainline) ADI
   SC846 it doesn't because the remote proc's memory isn't directly
   accessbile by Linux.

Uwe Kleine-König (2):
  remoteproc: elf_loader: Create new callback for copying segments to
    remote cpu
  remoteproc: imx_dsp_rproc: Implement .memcpy_tova()

 drivers/remoteproc/imx_dsp_rproc.c         | 120 ++++++---------------
 drivers/remoteproc/remoteproc_elf_loader.c |  64 ++++++-----
 include/linux/remoteproc.h                 |   4 +
 3 files changed, 71 insertions(+), 117 deletions(-)

base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
-- 
2.47.3

