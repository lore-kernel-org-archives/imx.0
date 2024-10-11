Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A77D198A31
	for <imx@lists.linux.dev>; Fri, 11 Oct 2024 15:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728659166; cv=none; b=Mwu7SE996Gw9xz7jArghlcLCeaBrFDWhdMkP8KsOlsQRELSsuKfNruIDfNshdb3PmJeMd6iLZSi+Wc2tRVJ/BJHNlU1snYYrU1ptFBRzn5H6bxjE82sD8cxfN7QJ3TIB4qIfn2QI7Wa2JjSfKgYM3SCazupsaquvuNOyTbTCSl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728659166; c=relaxed/simple;
	bh=p+Z1nDTHR3VSfxUEsfjfEreyzByYrV8byWoxxGPV0LM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UP49imk+HshHZSLDZiG3NR3sqr0Y/gtblcG7gWV4l+qNCjvr4H3uHYgPl/9YrCxcgxh978Q1LnMlY5z2jrfjwC5C/hdm1cnQWnJmpfvqh4i0X3ub+Pfrn9HsYNeLr1555qvQ0sOB2nznZ96ri9X5PoXiitkOOEJqmc923Et8FM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hcaqgCDN; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hcaqgCDN"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a9960371b62so242821566b.3
        for <imx@lists.linux.dev>; Fri, 11 Oct 2024 08:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728659163; x=1729263963; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QoqSFxBQ8OghEwfmeYsld4v/qGzAAXjDzimzS+scfuY=;
        b=hcaqgCDN9ppQwISgFUmmIQA0Ca8NN0ikkwdAVed8Pa/3yPGroPqMEEB9ADaXrSN+sV
         HOyChGN5qYXpg7ezlKgyYBIEnxeZjPqX2L58/Dc4YsBR5b/Ql58WYio7VFP2ncSGJog0
         c0PdZsISV6RHSfeu8RTXg/JfMmC0zyXsJDzf+XGt6YvX4w3o2iLvKmE5hDaCJ1lBrE8i
         8avT3EWre4pCNFaZGoDIU9G25LJ2g5LNrWVO5klFH02uzN8CEvTuBH3zGM0RmxM7fbu3
         vdLnaPMPfJhSju9I7fFguouo15z0HV/emK4GcYZ4SusyQWiDJu+PYnjq+grUNLKPXw6h
         fT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728659163; x=1729263963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QoqSFxBQ8OghEwfmeYsld4v/qGzAAXjDzimzS+scfuY=;
        b=A6XhXdeQHIArMUohmREB0ptS2OE+PDrBhjqwzTfXbwzdaqk0aFj1578FbOymAHdemo
         Wyhj2T4gI4/yBmTtZbkKuATaw87/I7rOL+ybcsIgrlfeDir0+f5k2BJE2cCqPNxu6CR5
         2pptTzraY0GFMPSUPzLTBoJeEMqFXqD+CueNpQd+lGnega4Zx4IkrkDoWndZic5Wckzt
         LWgsSpwUzRdWgShQV0F4mWhRegds2EDPrMAx2yeLlvu4HY++sHe2PXVw61e8d4MyFJ8N
         9sdtvk2oTxzUb3ZFFZX9PWunCJUingLIWqLxCptFS4LsOjZymXKe3mVnNhmnBouKThdr
         98lw==
X-Forwarded-Encrypted: i=1; AJvYcCUI/S7u6l5i79cpKBmz1/6uAYb4R473ZaATd4to2mJ67nhvQlzR9SX/bZbXhbH43Ry918w=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzt3qQ8NGB2Pew5RH8WzuSNX6NjcdGYKOUiOCdfj0uGJIdB59e4
	d2W4MsLapTS4FZDoi5YZkjj2OShRUew1K4FyQztQhNepQ786HKf4
X-Google-Smtp-Source: AGHT+IEBK2JXyYwVGn8UlFDP/Iu5LT0dm/NXZvW4eFkGnwV5w9jD8Oxv31hD5Iaue0TJQGy9tV1srA==
X-Received: by 2002:a17:907:f1d3:b0:a99:4058:67d5 with SMTP id a640c23a62f3a-a99b95849cbmr257504166b.34.1728659163222;
        Fri, 11 Oct 2024 08:06:03 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a7f5b0b5sm220879366b.94.2024.10.11.08.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 08:06:02 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Tushar Khandelwal <Tushar.Khandelwal@arm.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Frank Li <Frank.li@nxp.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 6/6] arm64: dts: imx8qm-mek: enable dsp node for rproc usage
Date: Fri, 11 Oct 2024 11:04:39 -0400
Message-Id: <20241011150439.4027-7-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241011150439.4027-1-laurentiumihalcea111@gmail.com>
References: <20241011150439.4027-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Set the status of the dsp node to "okay" and assign and add
its reserved memory regions.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 27 ++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index 62203eed6a6c..d51da3b6b3aa 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -92,6 +92,27 @@ vdevbuffer: memory@90400000 {
 			reg = <0 0x90400000 0 0x100000>;
 			no-map;
 		};
+
+		dsp_reserved: memory@92400000 {
+			reg = <0 0x92400000 0 0x1000000>;
+			no-map;
+		};
+
+		dsp_vdev0vring0: memory@942f0000 {
+			reg = <0 0x942f0000 0 0x8000>;
+			no-map;
+		};
+
+		dsp_vdev0vring1: memory@942f8000 {
+			reg = <0 0x942f8000 0 0x8000>;
+			no-map;
+		};
+
+		dsp_vdev0buffer: memory@94300000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x94300000 0 0x100000>;
+			no-map;
+		};
 	};
 
 	lvds_backlight0: backlight-lvds0 {
@@ -640,6 +661,12 @@ &sai7 {
 	status = "okay";
 };
 
+&vpu_dsp {
+	memory-region = <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
+			<&dsp_vdev0vring1>, <&dsp_reserved>;
+	status = "okay";
+};
+
 &iomuxc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hog>;
-- 
2.34.1

