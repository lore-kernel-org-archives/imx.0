Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AC6205ADA
	for <imx@lists.linux.dev>; Tue, 29 Oct 2024 12:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730203372; cv=none; b=qGHgpt7ba/xyXi7dvTthvE1xZaG89cgpIsvCHRj+9+KIXnNL9nmtoYbhuG0toErOaFD72Sf7OZFrxD9ccmw22TLMfFSomxSxn42lagopCt9xi7/hlq3J1Tpyd05LZ1B8d80VbjDN/1zWDVfum0n+RxYjDa7XjorPS8/89Z5/wXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730203372; c=relaxed/simple;
	bh=383MNab9sSylPzbaybz2YMoOJxM7CEApeV+isiGZE1U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rUosbP2vvbp5HLthfNFnxB/M2zlkmOOQzwUU2oiSg7322T4hTEdt7brC56ogt3UVjSq5loEmEAG4IKVxQ7OEzsNEtlJD6Q50JhEShQcmkNZTvOJikTsFbZ5T7A/OULYbicLUphAoXo29r3rflQ81Eu1N3S+vDRwW2nyHxMDb2Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j56OFDYg; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j56OFDYg"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7203c74e696so3886028b3a.0
        for <imx@lists.linux.dev>; Tue, 29 Oct 2024 05:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730203368; x=1730808168; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hcfVMusxKwU+TU6SIY1AuqRYgTWEMMrGe1VKj8U1/NM=;
        b=j56OFDYgb8m8HgebUWT8+JBqTShxoSx5N+KugQq50dkULlin07ejLyKnXSo3g2+g7c
         Pwix4WDSxsWibGC3xvSgPRhhhKb6gE7cIPzr38MAOSNDFaiX681VITeARN5AlEEpvR7k
         39sdmuJ5M0HGssG2nkx+iT5Kk/5+/bvN/hpDKBf82dwnM2A3VH2SBJveGBsoL2j6Rge9
         QguMZJhkG3XlAImdAbKGDL8RsUCRt/Hxn/qCIpj99oBER37Bl5nIIfzjo7Eo9mkSggsW
         ggtQBZmKYt8tviI3bcyOqED1YreHY8tXlfHpstyvHnl/s26iyTZu0naGn8/eJXQV/ryQ
         elmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730203368; x=1730808168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hcfVMusxKwU+TU6SIY1AuqRYgTWEMMrGe1VKj8U1/NM=;
        b=TIH/3OHDYec1Holf6NyqeuRvfi3hBz2cKGY1FeWhKoI/lNXp1p5nBLYHikB/9FoXes
         O+AXn/h/hUGCeWGDzj9cxtJ/LCcHZm2m4i2knzt/SSlGICHkNovwZ6kfoZjrz3xzv6xL
         +8D+jgz+c5Nr0IiShUFp9qcUB49tf2PPwiQ+uo4tAtg9NMxZgSTwovGeKKl/9qCREzZK
         cGfkcFEb1yfYHWEaSkqXU69ZKVd8Dkuir75bxmlG2ajDBCUXO3Suj8FHw3ksF4S/Zxqu
         xEO23MJKnN+te/CvOfPBce+l1jXL6byvOuJg+ExnyZ0maDRpWJh92Hp5ux8o+KiWi94o
         QzUA==
X-Forwarded-Encrypted: i=1; AJvYcCWfoiFamt6eVW9k9A80Lfvlmj4OGF6nh074xYVPteEWsToskj8bpBfsRyiazkTDOMQ0B4s=@lists.linux.dev
X-Gm-Message-State: AOJu0YwVN2ega1vpQVBAYAvmx+IwQxlrdwFKGL3iaEz1iFG8AXafwohc
	nxZ9B68B5Jh3+7kNzhQ8I93F5VCFDN0Ei5t8RFSNO2QVa98VWu9R
X-Google-Smtp-Source: AGHT+IE6/N4HaxtLmsC1vv1SohgG4z64qywId5rWMF+nsLvluOwKa5NTqFO4bJD8re1fhrw1o3yMuw==
X-Received: by 2002:a05:6a00:198e:b0:71e:7e8e:f684 with SMTP id d2e1a72fcca58-72062fb82b0mr15764161b3a.9.1730203368031;
        Tue, 29 Oct 2024 05:02:48 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:c7e4:1ef3:7ef7:5ae0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a0b7d2sm7428830b3a.114.2024.10.29.05.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 05:02:47 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: marex@denx.de,
	a.fatoum@pengutronix.de,
	andreas@kemnade.info,
	kernel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2 1/3] dt-bindings: lcdif: Document a imx6sx-lcdif fallback
Date: Tue, 29 Oct 2024 09:02:34 -0300
Message-Id: <20241029120236.299040-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

imx6sx.dtsi has the following lcdif entries:

compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";

This causes the following dt-schema warning:

['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long

To keep DT compatibility, document 'fsl,imx28-lcdif' as a possible
'fsl,imx6sx-lcdif' fallback.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Newly introduced.

 Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 8e3a98aeec32..836955de3bc9 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -32,6 +32,10 @@ properties:
               - fsl,imx8mn-lcdif
               - fsl,imx8mq-lcdif
           - const: fsl,imx6sx-lcdif
+      - items:
+          - enum:
+              - fsl,imx6sx-lcdif
+          - const: fsl,imx28-lcdif
 
   reg:
     maxItems: 1
-- 
2.34.1

