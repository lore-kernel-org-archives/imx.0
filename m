Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E19F36A5F2
	for <imx@lists.linux.dev>; Fri, 24 Oct 2025 19:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761333359; cv=none; b=T5jMIbrMSDC/eXxdWLxyR4NDOVnzg/++ZixRQyhro4T2f93zVkncu5p7qd+lKLLS2QmWT5dEBbZVHy+S0IFBqn8iYfRGJkGEmN9piiyso/KtWQr7JLY28byF3khb7SKbivUh1W6xN3A5fVR2AUI1OAbpuS8NiYC85YMKwttZO7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761333359; c=relaxed/simple;
	bh=nMCY7tqu98IJzjclxpQyavU8U1FNBOGWdu3yx7Z5f6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uualwpvD6sEdplpsJEOKOLIZ2jXcfKnUjKk5alz0GgXob3aXdVX3FFGeI109sizMZiZXkizsFf/BlSqKya8CiJnzvNQC16T/Pex2taUlPwCgAGvFfbGa5N7lwk892eYGdZi7zvJvojV7aUmvH24ULWlAQ4d4Z0Cpn4LpW+DJVCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ocPIlec2; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ocPIlec2"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-93f11fdd538so99840839f.3
        for <imx@lists.linux.dev>; Fri, 24 Oct 2025 12:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761333356; x=1761938156; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lOGEEJh/33D603wteGhrxPA31YJMUwUVVAtQyDoqnvQ=;
        b=ocPIlec2s+ZwE4b/TSmnhYQZWQ4SVqDE3Bn6tC22j+lltskDqMaF/+1ZSceu06IK+M
         x35I2VkRg8oWen5vqVWmanFmR0/dtCXmo/6Do5YmhV3uDENEI8Km1ubs15fRqRloN+mM
         2XcEBwzV16rapo0lXIVMubU68nbFKka8rQbuwqxjqZK2+Cv7uBbda44SaFGiRTYzgLXn
         rX0VIjqNPB1KrrJFlsUvCLJzBGlrSv6EoZkeG/6hIYy7PIOTK1cR+3ywUAQDi8LjPTq3
         PxVaTcctiAqWGCqvQ8lBha57cCwBsaNmTSQHoSHs+R9sxgqUq/3LpJNfMQcoJIPoS36d
         QzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761333356; x=1761938156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lOGEEJh/33D603wteGhrxPA31YJMUwUVVAtQyDoqnvQ=;
        b=lvDr6FulFyxoj8xLXc6al02oqEMEXvq0tLlb2Vp8qldYXiOCZ/pDuggqYxk6NkqJGK
         iFxSenvz0zrKQBuKYkZKIKQYdD3UTDj3mVpCToFOhiTZn3u+Lsx0FSieAs68BMNWjDYy
         1VCxhqZ4e7myDUTRmi5rNJPA9vxjg4E34MovwwJj2AamOMF8NHUfClWrAz92ZOSq+oWb
         pTIzcPRnwbRPyvA/oEDUle9WHflyB9uLKfNcIBmD62jJGXQNTTsZ0u/uQbnPpVfJxLvr
         T6KxAVnUCszJ4N8Ie//Q7fjtHsf6QUAmONS7BPqXCqjKklHtWaGJFhcqnsxTTXNUCMvO
         AG3w==
X-Forwarded-Encrypted: i=1; AJvYcCVFt6yLCkqx4BNcyX+S+w0PkR4MPjqm149Fr/ri7a7KNpD5LWesC1b4Qy5tuX+bzzexciw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxV8pp5FXj5/bh+PiA/JZDgSwp1q9DuAMvQEZJMt3pvXi6vIz8B
	1cZH5ivESUBiZlRjr7c2cTKebbXZmrIq6Gi1z/2Bzbs0m3FCpZZQiXVKwn6kixmiE0A=
X-Gm-Gg: ASbGncsro+9CTS8FUPHIlakpK/FuAwQW6OC7xoI4EIVWPOT4wi10AVvMf23aeKfMtLv
	7GCiodsNWOt2FRq/JJR4Egrn8+SY26PY4v7PLHS9Ga1QDJFur02YNCg4aQAfMntIjD/8GNqgWaB
	h9Sw4kqWiLHUvyXjeoyU5LjotSpYNfZT+wcuk+f9K8o4eJe6eCAfOPh8OudT3uZ5a5gxq8SkD6I
	xxg+fEUOApDISlZa8iZPnrBwGtKWWg4veJaD5ooYPd+pWtfrhZxi0rVYCT1tuycHEt9sqMqB05Z
	TvodilvWT4mU8P710aRUZW1SMBCxkBBMq1wqKSeV/ueM/vzUTebj/P6ycTFIKX53f0XSjV2iAIB
	2iwDZn4a2VEcnYTmSAgkpH9SyiH6823lYOLnasjM9agtAgTPVmcRaHGL8tTsoPR7iNcsbDsq1O6
	wH//FFfnHcBcCCdiH9Srx1vdSrAjAXWe8wp/MkA0Gyoo3zW+4qLiMZDQ==
X-Google-Smtp-Source: AGHT+IFDogyL6cWcfQwc3FAklbFwL0iLqDuDqQppxCvEgv6jdMEMsj7R+FgIMqftII9RxRpxH7qsMg==
X-Received: by 2002:a05:6e02:3f04:b0:430:c49d:750c with SMTP id e9e14a558f8ab-431ebed79admr44368525ab.27.1761333356161;
        Fri, 24 Oct 2025 12:15:56 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5abb7fdb7c7sm2427824173.44.2025.10.24.12.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 12:15:55 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 1/9] dt-bindings: spi: fsl-qspi: support SpacemiT K1
Date: Fri, 24 Oct 2025 14:15:41 -0500
Message-ID: <20251024191550.194946-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251024191550.194946-1-elder@riscstar.com>
References: <20251024191550.194946-1-elder@riscstar.com>
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v3: - Added Acked-by from Conor Dooley
    - Added Reviewed-by from Frank Li

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
2.48.1

