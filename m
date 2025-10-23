Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A2034B19C
	for <imx@lists.linux.dev>; Thu, 23 Oct 2025 17:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761242370; cv=none; b=E4YhW1NPYk0pMUxECGyx8TsVMX8FQ9aaIAZBxHcMB8K0Tf7RzRPlra46jcWsbe7Vtxn9nNuLmGMQaSavgTHU65b8KlsuaTJMNdlMutQb7Q8Y7VTi/nZYApO0he8a3fsaE96JEdjLEZ3w/mdlh22POwPNR56j4osUktlnLG1B6Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761242370; c=relaxed/simple;
	bh=a/X1Acv0a0Io7YPwnyOgCxxAkklMU8dT+67o6Oa6kn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iKQxFn5wHI00S5VmdF8gdqiPuvBdtwAggY7rONVv/Kko9srk0256qv+L+YQakd3A+CGpnXz+mbPqfWPsGmvl0Au0gelHZNJzPXObrFE/Uc6zxxdK8oduQL9X3lHv6BLSLT31Ff9WMv+dfuy2bOA1RlYWZ/DPDEYprjOIL+cB+RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ok2rQ96E; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ok2rQ96E"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-33067909400so867508a91.2
        for <imx@lists.linux.dev>; Thu, 23 Oct 2025 10:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761242367; x=1761847167; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wfBpxcQetznup7hF07KUJDBVrurA0aaR62AdWj47guE=;
        b=ok2rQ96EihiASNOkCBm7kKEk5CJs9LicMhsBDqpObTqnoNi/URqTLgPAjAc1/C4P4U
         c4zm0IzyQFhptOAJs6wzPLs/TmvRNxeQY9f2Dcg2DDuQnUdOs+756D6CRrhRE88+X17r
         6fKm9cpE9rjd5dWJ8XYiUMXFwnT93PJzTmbO6kuTvgap/ByfsPpmfWUL7BOznHivNUZb
         lyP7TE8lKzeHcgtavL60mex5B+j90g7JJ9b0vPmZwpSovRhx9ai5aTT2pVxES/qzE2Xo
         lsd4XENZi14SN8r46EI/6EI+RDudlpD2nmwLRbrU+yewJqyMrox3OhIk0UeNMs+Wu/pn
         UQ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761242367; x=1761847167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wfBpxcQetznup7hF07KUJDBVrurA0aaR62AdWj47guE=;
        b=hlk3YixmaEvohvmU1ugfrqJh4fFEBzHEOR4Fi3uU9P+EUW5GWG2wkFD8CPq6+yZ8Va
         az/v5vKWbr9HNml3uubyNmSYhRq2HjaBakBC4Ob3hkz9e88Td9xwCxqB4XB8YW3qhQ/p
         5gsxrG0VGfksKROeveOZJn7xHL6Rf1MAuanTZc2uGk9lkh7pR7WxZcvvO69fr+HYOiDx
         767vdToy1XRq16qFMZPKnKqyOnxB6eP4hzBBQ3BGjFUCRLJKC1t1BAIt925jzersYSmZ
         2d47PCDoRVmdNxHqET4fenH38D8k7jYEkjwuWF7gRqAPisp2GmudWrI9zgP7JK2Tcyb4
         JODQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoDuCdHcg6fmasVz01kKcog78egwWe0rkXnLVcQNWVhi61J+GxlpC6QrKXUQzfK1It3aI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/etgFho+fyl/RLXtXJQknPXB0PL2Xfc3yU5FYA5juwYORKGF4
	aCh1ZL4O9DL8iRRZIkQb6Kxx2/PeBc8WPEFHXJIpXWp8m8V6RSkxKLAWxjIlED49+rM=
X-Gm-Gg: ASbGncuVn/g6EFBF0VvicV5mjCxbUJd5+fsgXzkoEqAvIICyQM6piERvVSbEN57pfpW
	fyoAsM/UFJGJVRcI1rshjJS0SHBFHik1oVAt0mc8WOi3KEpoayUg2ZFvFR4go14wRTbmIilfII3
	a1gGXtVbO6EtHvVI2dI/kewyTX7Lu7El2cJG1SyQ+REfdFSGw9V1UEFnca4P5DDCbVcdC+0/N6g
	eJeR1JKMH34KRMmkAqw5FEc6RNo31KMEt7XlhKOF0BxYlwGdcMdTTGBf3A5zzzGtueHxOWqWS1j
	Oc9tSRXrtrxdD+nNB5SpvCdyPneZLA9TezOdUUgNxfebofdIDAAq2eIpB1dAj2lQu57HFHFW/eA
	qBeuIdsioSqUWkYp0plnWCQnskzZCvdxJLqOUq4xE5/eJmJPfNoczMVa8Up3uSoxzFoIX3chsD5
	AQz50ZUbE/KqRWsNeK8sYb3q1LzmUxSbrNaw==
X-Google-Smtp-Source: AGHT+IEiskDsftPBzROd2WKzvcPRxdNUDdrslLqgJ10XkgDdwMsWJwp/kE4fHkTeBllQGtyODL0OHQ==
X-Received: by 2002:a17:90b:4a47:b0:339:9a71:efd8 with SMTP id 98e67ed59e1d1-33fafc8fd43mr4507074a91.37.1761242366629;
        Thu, 23 Oct 2025 10:59:26 -0700 (PDT)
Received: from zoltan.localdomain ([208.115.86.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223d1265sm6447431a91.3.2025.10.23.10.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 10:59:26 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	han.xu@nxp.com,
	broonie@kernel.org
Cc: dlan@gentoo.org,
	Frank.li@nxp.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/9] dt-bindings: spi: fsl-qspi: support SpacemiT K1
Date: Thu, 23 Oct 2025 12:59:13 -0500
Message-ID: <20251023175922.528868-2-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251023175922.528868-1-elder@riscstar.com>
References: <20251023175922.528868-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the SpacemiT K1 SoC QSPI IP to the list of supported hardware.  This
is the first non-Freescale device represented here.  It has a nearly
identidal register set, and this binding correctly describes the hardware.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - Point out that this is the first non-Freescale device used here

 Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
index f2dd20370dbb3..5e6aff1bc2ed3 100644
--- a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
@@ -22,6 +22,7 @@ properties:
           - fsl,imx6ul-qspi
           - fsl,ls1021a-qspi
           - fsl,ls2080a-qspi
+          - spacemit,k1-qspi
       - items:
           - enum:
               - fsl,ls1043a-qspi
-- 
2.43.0

