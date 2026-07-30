Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F03844C675
	for <imx@lists.linux.dev>; Thu, 30 Jul 2026 16:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429330; cv=none; b=aDGuUCd2VQs2C+UryJnM0g4FqKnEDqx08Vw1z05fvUC5CMuD+Gw16zEsf3g8E/H0zX231WFZk1zHXG7xRkaleg6/8E1XXuLRS8FHzvnXeTQEvDvJGkXOtzlIoLHDzJ7UOsMUTRgD6Pysva/s8OcCGAtDvnfrOKawUur7+/cWFaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429330; c=relaxed/simple;
	bh=8yZPGfKuz/cimxOrEnowvfRBLrOfYWWMq5XiuETxLs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a4QelnsS7IXXE6ga7PbBrnVbrS+fkGacZe4tPkeAKN+hlOCWPlqiA8xEiHtdIFnRmUFPDK8riUsQXGs/gbflw9CtVJ/4w1t29TCEA/iMH3CdKClTNEcKGlMOqwFthkqxsGeps58lvHVnMdUHoVKl6xAIvAoFYc4NVUaSKE//bpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C0A3vd52; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0A3vd52"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4728c12ba97so1517809f8f.0
        for <imx@lists.linux.dev>; Thu, 30 Jul 2026 09:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785429327; x=1786034127; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yUMfJpXpxaZ+31yr2qH5Wu7mIRrK2wr6B+Y3FcFImbE=;
        b=C0A3vd52lp5tKYQe1MleYtjNa6REBmXKioqbHJg6Rw+zy3T2AIlzz2p0/HP/U6A799
         SufTR9SMY2oZ8WqSpnri/Q0f/oMwvMGt/t4toPai9hqNB55PnQZVS6ZtVdAyMQevds0O
         P3RMI+Df/5arumfV1V6/LrNg9UTQcnPkReoj4wbM+eTl6aopMx1XLnqIR2bAO51UI4ND
         SE8Tm+J7dCeaES648zbrd0WevsHD4YE7ufHhp/oyKafVe53HjHqNTsxwkNAY4tcbl2aF
         5OcIpP+8JtUfP02SLRwWqUwBjVXecNQh5oUBRTDUF3OFYyZTk0xZmvOHj9EQMqRypkPA
         CE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429327; x=1786034127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yUMfJpXpxaZ+31yr2qH5Wu7mIRrK2wr6B+Y3FcFImbE=;
        b=kBstNu55vEabeCnWTiAY6gjAoV091Y2xx9Zgci6eneQCjc3NVkuTdqAP7QrEt7TWjQ
         ucOB/O1y/G+y4PuZegaZnhB949PzZDp9/a+Y+1RoE+rrzWty/kN7cme2iVLmoMd+wYN6
         gCs3Bv8Hz4a//hU9emD5nM70bcDylg2zTTI9SyIeZBCUx0kKSdEsgxMfrkXdOOpBSJzE
         nO77zxUCjUbrw3aWciY6ZAegp4EyOqh+R4ZPNDT4LinM7kPDHW0sAexvEBEqlhosKZeM
         R9SSd+FKdQD3QwLXWlanL1hzAPzreIkhf48dzxsB3XzaSgtNxHe1yIgyiNEYJv50e5rb
         aYtw==
X-Forwarded-Encrypted: i=1; AHgh+RrKVZyltlwFm432ZmlZMvK7mNrhZ5LVeqotcLN1fd9qoWTj3FUaP5qYjsuKLlZY+77xGlg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQmbYl7LXTRkpmeXENSZjxsPo9/JBc5yHASB15DXCo1kqQSZmK
	iAytnuwk9D9yhlmbOa6IXAUwAG8Tfa3YjmuWjkIMnPe92wxbkTeDPp4Q
X-Gm-Gg: AR+sD13m7ZGcG8QLoBIPQMDy3UwyeJCiWubfkLP6a2RtolEjsgdbp2aaKzYgcXdJQ58
	niYtxI8mP7RZuzVsK6cPY1FEi7td0YazjLuMrBut7J80X0Cz7bgMWCkig17bPw/XsKfQ67rIfRA
	A1S/t7Zu6TxqXTFNpbt36n18QxgfAwQN5r03yE/vo0hfXNgdkJ5oZ74G8e/MC36qrRN8H0EbVtx
	dUoegbiXP+H3S+m01bYwsCll49TPQ30d18q4kSqzoE7TxpWf+Xb7zf/NVhub5vhPqXSooAyYRxs
	6ZpLzXjFw28gRrII6K7DHxQ366F3UrJ7XFBDEJOTPjcv02hNBz/bD7Xp3txXJIDNOM+aNdv5xLi
	1BbwoOpIK4ksO4bhIVYors6oaEOQhEc5i717xRteq+ioXp+rBKBWieSsgHiKv4yaSBM0qWIEqoa
	gPcsSwWkcVkp+biGWCaQxTgmcZcUKpoJAOIIBSweOksMrep9gUQUGoFgwfa1f3+c8WZ6vmxmCQ3
	Mvh+Es3fDGgGQ==
X-Received: by 2002:a05:6000:250d:b0:472:3090:d878 with SMTP id ffacd0b85a97d-47fc81ed0efmr4793087f8f.4.1785429326919;
        Thu, 30 Jul 2026 09:35:26 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc892cdeasm7758445f8f.22.2026.07.30.09.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:35:26 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] arm64: dts: freescale: imx95-15x15-frdm: remove some rmem regions
Date: Thu, 30 Jul 2026 09:34:11 -0700
Message-ID: <20260730163412.1145-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
References: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Remove some of the remoteproc reserved memory regions, which are currently
not being used for anything. These will be added in the DT overlay
enabling remoteproc support for this board.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../boot/dts/freescale/imx95-15x15-frdm.dts   | 21 -------------------
 1 file changed, 21 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
index 0f43e3be7058..f9b0e266754d 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
@@ -188,16 +188,6 @@ linux_cma: linux,cma {
 			linux,cma-default;
 		};
 
-		vdev0vring0: memory@88000000 {
-			reg = <0 0x88000000 0 0x8000>;
-			no-map;
-		};
-
-		vdev0vring1: memory@88008000 {
-			reg = <0 0x88008000 0 0x8000>;
-			no-map;
-		};
-
 		vdev1vring0: memory@88010000 {
 			reg = <0 0x88010000 0 0x8000>;
 			no-map;
@@ -208,17 +198,6 @@ vdev1vring1: memory@88018000 {
 			no-map;
 		};
 
-		vdevbuffer: memory@88020000 {
-			compatible = "shared-dma-pool";
-			reg = <0 0x88020000 0 0x100000>;
-			no-map;
-		};
-
-		rsc_table: memory@88220000 {
-			reg = <0 0x88220000 0 0x1000>;
-			no-map;
-		};
-
 		vpu_boot: memory@a0000000 {
 			reg = <0 0xa0000000 0 0x100000>;
 			no-map;
-- 
2.53.0

