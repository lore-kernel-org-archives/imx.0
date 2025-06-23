Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BBF2D323F
	for <imx@lists.linux.dev>; Mon, 23 Jun 2025 17:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750701427; cv=none; b=oTrXomuHW/fIql1hiu9KEZTxdty1qTn6T52VLKtfMLhznXpjZbZ2uQtBhNMyjaZ6rfqoijdjQFHL1hAPhAFbsO86sy+xXJwQkyVdfbPDJaZvZYNnXymSajMUavXkMoVsRUYlLtmGBCFMD68ud5KWNMtjSxD1qh5DWrg1yGRHqKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750701427; c=relaxed/simple;
	bh=D9hK6aCg1zp32zCrrbFTJLWW5r7AZGwUreSAc0MrHXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZP5xDjagAUcHHWJcD22K/mTUjDj3HBjpMr/VwAUE7ZS2QG8RfG80iHsuJfoCp+NGwNvUY74+fy0+ZPn48YWYFIxx6V+RGar8zZQyQ0c8XGMoAkVnCU+sA9Fn3JKgr53gZWL6Gn8Zts44vHt/RT45rRbUTENnn2CFL1401TSmI4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CpXgkxFQ; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CpXgkxFQ"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-609c6afade7so10148625a12.1
        for <imx@lists.linux.dev>; Mon, 23 Jun 2025 10:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750701422; x=1751306222; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sfEbSpxuj6iCO3S7ehFSQfszMAGt5vRbG8XfTrlB69o=;
        b=CpXgkxFQjvZQAwMU0RR+4tcFGirCpwOhukp1Q5nFeePCPbmzP2B5+ajuL3OfUYP60X
         dUgH+joO4AWLuVEDZOujevFkBwfxuIGX6MPHVqrayuzDQCZMidAKbqqhdtXnYP2TVA8A
         yY6zZ37DDugV6fCUP7/DCq5ZeBkkQnmIZCwsNdRqDfP/rHKFIcAtJJrsXbYjheT2Or31
         ghR3RkZF8c9UqFuqQ/OzEzabTV688EDkdx8/Mz4a8PmxMxfLNFmC19BelJXxp+GFGAYx
         s36hq8gIv2kSRnPRPWn8eIfV/qJdWsZxyq4T9gCaQjwqfKXNZiZEM54eo/qDhVjl/mWz
         zAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750701422; x=1751306222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sfEbSpxuj6iCO3S7ehFSQfszMAGt5vRbG8XfTrlB69o=;
        b=SHxuu3vPO8rEbHgYIONOq0V+D7cxdJK70QaaBJSWRmB4M+QXaO71PiDQiZEfrKNYAX
         C6rseLgKNYxEJRoJ2EGB85YXtNL/sEDql0fTCZ8BdS6Cm0BnwXZeoxdun919HlCvZzQe
         O6dKlE0IbdMxr/hlVxON+B4GT/c+bK2NMAhJUKq8cThQruueBeWAz0PZ2QG0ZDWPDjPH
         3ecZtcfnt8n+6IMUnJqbBPG5/2KhHH8dvRko7dpSPbns7R0bwZMzlvw3cFMf52+2dyWI
         eOCoAnNWgLS3PsKvehLOC60OuJbgxe7RT2Oy1Q2RhtT+fjcoDJodE9gqoc6bkcN+aEVn
         pT+w==
X-Forwarded-Encrypted: i=1; AJvYcCV96RlnzCthL7yx+AP6e+oQsCx5ga4BKVZ8Q0FsHCCeJTgc9wewbu60syV0JuFh5bEVXbE=@lists.linux.dev
X-Gm-Message-State: AOJu0YybFuASOi2kB23gXQokHdvPrwk8EY6mfho3u97cDimCpWqhR3Tf
	EXEDokLGdgJQW7s6cYQGGDeVnmOYPHRJ+K1JV4KYw2rUlEs6NaqUxyB+
X-Gm-Gg: ASbGncsL1oJPCMDN7f71BRRzArRz2qqcTOcTsuRUpZ3+tX65r8KEp/2UU+E4NlpVytj
	vbQsmlj3AhKYDnshXpC62WWrJqgIje9qKxcPQYlcFtq64ropZ0MpFW9ZfPhv3Zj/NwVCF1sReRv
	d5jlcMGLgAQQzS+63JzGR3B8bi2QAaO5GNYLPjvaZ/jpaeO/dsj7qdIuu9KQMX9md1vCtuuMzNJ
	SIk6sezMYRAFNo47WjAgU0Vx0+nTEYJ9X0lJnp1WuBtJzSbm5CUh2PMxtZ9s3y/7Ar36EBYvSfM
	tyUu90Gd4MKUJI8K37SbVCWmBR6ExvrQRSoD0g4ZNBn9G5/x551f+rkPoBhH8OBKdA==
X-Google-Smtp-Source: AGHT+IGuAcG+GXrfdigNkDxStpd+S8OA8ZKWEze3cbtEMBDblwvHmNJAD3Ekbk37wTL6q0w5F0fZFg==
X-Received: by 2002:a17:907:9558:b0:ad5:9ff3:c6ce with SMTP id a640c23a62f3a-ae0a715dcd7mr43147766b.4.1750701422257;
        Mon, 23 Jun 2025 10:57:02 -0700 (PDT)
Received: from wslxew242.. ([188.193.103.108])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18cb9e5dsm6360789a12.53.2025.06.23.10.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 10:57:01 -0700 (PDT)
From: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>
To: Frank.li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	boerge.struempfel@gmail.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 2/3] dt-bindings: arm: imx8mp: Add Ultratronik Ultra-MACH SBC
Date: Mon, 23 Jun 2025 19:56:51 +0200
Message-ID: <20250623175654.844281-3-goran.radni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250623175654.844281-1-goran.radni@gmail.com>
References: <20250623175654.844281-1-goran.radni@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document the Ultratronik Ultra-MACH SBC, based on the NXP i.MX8MP SoC.

This board is manufactured by Ultratronik GmbH and uses the compatible
string "ux,imx8mp-ultra-mach-sbc".

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Goran Rađenović <goran.radni@gmail.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index d3b5e6923e41..9cf2ab3b12db 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1101,6 +1101,7 @@ properties:
               - skov,imx8mp-skov-revb-mi1010ait-1cp1 # SKOV i.MX8MP climate control with 10.1" panel
               - skov,imx8mp-skov-revc-bd500 # SKOV i.MX8MP climate control with LED frontplate
               - skov,imx8mp-skov-revc-tian-g07017 # SKOV i.MX8MP climate control with 7" panel
+              - ultratronik,imx8mp-ultra-mach-sbc # Ultratronik SBC i.MX8MP based board
               - ysoft,imx8mp-iota2-lumpy  # Y Soft i.MX8MP IOTA2 Lumpy Board
           - const: fsl,imx8mp
 
-- 
2.43.0

