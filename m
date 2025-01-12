Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7A33C1F
	for <imx@lists.linux.dev>; Sun, 12 Jan 2025 12:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736685702; cv=none; b=OB7ZvMBQmb1iMYHIYAjr+qOAEEkcmHlPt5iTw3DeGcfOWn41/qrhEwRHO+rQUpU2atE779JvzQ8YgiOJQn0q6ihMWiDSOE1encEAYYrciOUBb4aQMyp5k+Rq3yZ1jK3u7ulqY1ZgRjAvCqOcjwJ2bqxb02YfCr/6ZdPTnGwF+ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736685702; c=relaxed/simple;
	bh=ud/rqWRzKS8SRsdYmZI+BU/HuEG7B2MYPUTZALmGjcI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tG0OielvW3gjLcOLEUzsUhJAnQ6+vwNrJD98L5Ur9wyecn4QkZdF4jhoZAVEmWppaSeej1grGKlv2tsQ4xr5s3PGbOov1y2vw4l/DbkjYfIUxVdCbYVlarGbqdk8zSkzUxdi/WD8CavbJKmdfT+3u+yxaukmtDKZjLK7DKm9CoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXxoHT/t; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXxoHT/t"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2aa179a8791so2069607fac.1
        for <imx@lists.linux.dev>; Sun, 12 Jan 2025 04:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736685700; x=1737290500; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yK8Ib4fw8NsyzmJDMSwKub58WZSMVWEX4G9CGBONcqc=;
        b=eXxoHT/tPgHlvywmo9cbBSiXJCIRmLJJ/HhgdGtZOpeX/jovnjLGQj8WWitSIK7Se7
         MzxEAlMrQpyrzXilXnx+PbQTVk27Byy2N1oTlCY5OJ/Rp1H5so2IhCovTz0CSJ8EX6Fl
         1iInBRzXfkXRLRZhwxLWXhgiWFIzuXTDlzuTRynbKCR1Z0Xys3NW+KJEemCJnF/qCANX
         LikbK9xHzyEf+D6a4ALpZDWTUiLoDh8iiGEX4JFElPFJ9jnyE3lNY3kbqIhEaRwpAZRg
         MgG5hx3ytrANwJN3jEBxR9eyo/PTiQmMAdcj//ia0XeZXd7fMFYOuNi+PWGJ9utrukEg
         a7aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736685700; x=1737290500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yK8Ib4fw8NsyzmJDMSwKub58WZSMVWEX4G9CGBONcqc=;
        b=h1MgHgVqCodbBYO4urvvCc8PNcfTdhyMfZghvjovAz2woOP9eYly7DBHe6eUas/nj9
         155Xj1hZ1ngKSJmFK1EfikmfARuse1BV27QRtk1F0MpS0uM3G3jDi/SXsoBpkcyo8BjQ
         qtXQStwfBsRdirTlgMXvNaKq4QkE9PN3isy+RJPrpGQ6N1/6AqJ1dOtTWyVvgJ/hj6yD
         LoteDYPoa9LgCYUhzh2djDT8oU4xGkmq6S1ibFZ6jnmJTNUXK7YwyigSA/v9XQxYcyci
         wnDTJtETJwb+kJGZBO4Dk9L2KRk01aozko6F9wBhDFcDvYsNrDIfcAfz0afG82ChMHBy
         tz3w==
X-Forwarded-Encrypted: i=1; AJvYcCWhM6xXwjmrCKby+Xncw48qFkGz8aMdEuzvMm2/Y17cQf7dFWbvKG1Cq7w2n6RcYwFk8fU=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywp9q9e33pOlws0skjsJUSFjpu27Lpo5XeMIGHrSgle9yuDLpKz
	QHUg2F9PynuN8W7lknqKjjHPfW7qRbQkX5JHixqhYkF9KPvPQ5zz
X-Gm-Gg: ASbGnctYENqaKdaufB3G3uEowFKaRj2D6WL8i/rmTSgLaEFarW3YUz3rLBNV1rXWOzz
	0jQh8Lj/BGt/rXHlGt3+uc4MYwDAn3c1RTp5YyVGERmPAW89U23mjwvQ7fapYj9U0gbxI7R6yms
	JKCB/Mw1b0dC1FLKUWFSwbQuNJ4Pr5liarOjT9Rxnuj0l5ZJbMPlwubLDPOPOqURdgalaw8uXDM
	tzj0IfhcVFEk2elelGnoycYsCSUK+00iOkEYWbjp47xH9uSn+2BpLCKviE8wJ2/kMggoA==
X-Google-Smtp-Source: AGHT+IHFr0aj/z+89tWIhkpVoC3SkOL7MWt04vlkUhov0KBX5ymEsZ1beGz7jSVZU6bNnGc2lrRlYg==
X-Received: by 2002:a05:6871:a08b:b0:297:28ec:9b26 with SMTP id 586e51a60fabf-2aa06945c60mr10074338fac.33.1736685699705;
        Sun, 12 Jan 2025 04:41:39 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:8c53:b609:d83:9568])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ad80a527fdsm2816771fac.50.2025.01.12.04.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 04:41:39 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] ARM: dts: vfxxx: Fix the CAAM job ring node names
Date: Sun, 12 Jan 2025 09:41:27 -0300
Message-Id: <20250112124127.994141-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

According to fsl,sec-v4.0.yaml, the job ring node names
should be 'jr'.

Change them to fix the following dt-schema warnings:

crypto@400f0000: 'jr0@1000', 'jr1@2000' do not match any of the regexes:
'^jr@[0-9a-f]+$', '^rtic@[0-9a-f]+$', 'pinctrl-[0-9]+'

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm/boot/dts/nxp/vf/vfxxx.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi b/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi
index acccf9a3c898..6334ad4aec4b 100644
--- a/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi
+++ b/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi
@@ -725,13 +725,13 @@ crypto: crypto@400f0000 {
 				clocks = <&clks VF610_CLK_CAAM>;
 				clock-names = "ipg";
 
-				sec_jr0: jr0@1000 {
+				sec_jr0: jr@1000 {
 					compatible = "fsl,sec-v4.0-job-ring";
 					reg = <0x1000 0x1000>;
 					interrupts = <102 IRQ_TYPE_LEVEL_HIGH>;
 				};
 
-				sec_jr1: jr1@2000 {
+				sec_jr1: jr@2000 {
 					compatible = "fsl,sec-v4.0-job-ring";
 					reg = <0x2000 0x1000>;
 					interrupts = <102 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.34.1

