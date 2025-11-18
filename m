Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FE13730C1
	for <imx@lists.linux.dev>; Tue, 18 Nov 2025 16:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763481787; cv=none; b=pirbdt98sc1cnImYHTlpetOIkRyXAtTkLRtFSB5p0c7EL+801m+GiDINAh2TB8wRennjbl1/xgQ4JYY63wQW2gFCLXreTnu/VmsG9t+99geRKQKbu40G0EzS1nZjP/EIwUEBza1ZjNpi/SPcJSMvGyoutEeuz0Fmz4ZlJYsbjwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763481787; c=relaxed/simple;
	bh=8CNzFpWGHJiJ/kMik9XkodfqnXW6wo433Z1B1kwxkag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kl0cgjsydXLrt4XdVLfwRUFgB10B+9vg1yBldzoyQCGylvaWwkYhiL+UoYlKnhIKXwp9xPckuZPzGFs8K3zqioqqCfAAkBg+SznVxgtCT3gqHOmWDKjA5s3OYw2fmofNHJYtjPb2kqnrHTXdq7uJtTetppfk7CTwO15D3YTqfY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=beGdJF8G; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="beGdJF8G"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so26682195e9.2
        for <imx@lists.linux.dev>; Tue, 18 Nov 2025 08:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763481783; x=1764086583; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tA1YZwkpqBYNCNgFaNMq2uv3rKscqjzMZ5GFDmRce68=;
        b=beGdJF8GTeFcIUG664pVL7C6cWCb0kLm1U2peQicz9rPWQblfFZ3OS8lQFi9cczl0e
         VnIEVWD4MX2vnusD4juyELhoS6VHk4CatDxs46jx0AlTzO1GduWyDHtIIqe7A4N5kFYo
         HH8tg1vtLFpJokoGK8KXx5f6mEP1loFH/cDEYxQ04+LhgQeU3S6otxSh+6DG4J0vA54D
         nrE3ZDnN3HXs4f5XX+qrnTBuzIpnNm1oS3hsSaLb8SFL3mITqSWCxXYsPdfxmEeon4o4
         Cc67HUhdVzggd6paWHpBHGuf7EMvJkCJX9QeV90pg2nd0Xr7J9h5+FpRo7g/WTsotEqn
         E2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763481783; x=1764086583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tA1YZwkpqBYNCNgFaNMq2uv3rKscqjzMZ5GFDmRce68=;
        b=IQ4cw+ZyhFyqTdX0qv44067AASObC/TRJjdqAHoMit/vPj6LePg0cJSLodgvzh8g29
         DY/YCOkjDQ689KFZsh+k9h7UIppmJnTKbfa3HiHVNDsD7ucPsleeYLXdHnAsFnP289NX
         wPxVXLg1tmahZ3LOSxYbJ7gW6YaiBBL3PU3pywEoScp/XAqYMRG5nhgJz3LcE3RJULj6
         FiriR4Ji3R8gQ384KvR9ck8PjThbTm//c4rRl+sR+l4eGDX2tYgJ+vnr78PhUBa+hl+v
         x40Csc/YBpB5XBVEgF9mDRolfY0mSVZ9Lk5fsy4vWa+q/PZzpJuWsE0SOsKFpJ/lmJDe
         ex6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVsxnKrRKLJ5NPGzX37zp4pgTBspAmi5aDQyH4cX0Vlv7Qpn01Wf5uM7dJ/Rpoqv9/FbG0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yykise288OmkaQ6wzLI73YU+VZmymITlly41kqdVUqEC7dGkN0G
	VkSiSqzAqwrv8czO6RQOg5m6iluYbz6bvPkUUd2jyCdRojtbcaH0CM0ZIhMtPqwMGtw=
X-Gm-Gg: ASbGncttb56vZwKATftJFfCwF7br1OSWlGmBPcwTg5oHm/zJR7N6vMQqqgNWHTTIJbM
	dvW88CgIh/HJrfDXAx9wDIdR7SBReFY0sWf3Fuqczbi1nfPA/Rlu1fVpr+SpFIawjL6NmwEXOC6
	blfpjwNfmoTnxIYRIuk27dHUFXCTl5WTi77BdWg/3C/Li+6eogntwM1YyXrrBl7J+3QQuHRspt0
	37o998UR3oHV8+ko8ToLkiALXT5G6MiVG3oia0mZ/gO6A5SgVoImf2y4m+MKEErACx7y+saNv7k
	PL56cZBHCarhGmtyd5pfcg7F4F3853LOZVZPnKPoV29AlkSYXuitQggeAqNfd4KXBqqgngnrL1E
	B9I9ox3D/uXuuD204QMfWLgH/04ZajEZUDh8lDYHHRyL0b97VnDWA87R797QzB8fugjYFtOTs0X
	OrgXoUp5ITe7BgarjCxYA=
X-Google-Smtp-Source: AGHT+IHP42lpaoxGDvnSTeMKhUhW83P2qJNjoVXFLokLHe+fGU/P+jnllwRuJQY+oQ4sFZakhTOjHg==
X-Received: by 2002:a05:600c:4714:b0:471:d2f:7987 with SMTP id 5b1f17b1804b1-4778fea8d93mr142436175e9.26.1763481783366;
        Tue, 18 Nov 2025 08:03:03 -0800 (PST)
Received: from vingu-cube.. ([2a01:e0a:f:6020:76db:cf5c:2806:ec0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4779fc42f25sm171954575e9.6.2025.11.18.08.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:03:00 -0800 (PST)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: chester62515@gmail.com,
	mbrugger@suse.com,
	ghennadi.procopciuc@oss.nxp.com,
	s32@nxp.com,
	bhelgaas@google.com,
	jingoohan1@gmail.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Ionut.Vicovan@nxp.com,
	larisa.grigore@nxp.com,
	Ghennadi.Procopciuc@nxp.com,
	ciprianmarian.costea@nxp.com,
	bogdan.hamciuc@nxp.com,
	Frank.li@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Cc: cassel@kernel.org
Subject: [PATCH 4/4 v5] MAINTAINERS: Add MAINTAINER for NXP S32G PCIe driver
Date: Tue, 18 Nov 2025 17:02:38 +0100
Message-ID: <20251118160238.26265-5-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118160238.26265-1-vincent.guittot@linaro.org>
References: <20251118160238.26265-1-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new entry for S32G PCIe driver.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e64b94e6b5a9..bec5d5792a5f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3137,6 +3137,15 @@ F:	arch/arm64/boot/dts/freescale/s32g*.dts*
 F:	drivers/pinctrl/nxp/
 F:	drivers/rtc/rtc-s32g.c
 
+ARM/NXP S32G PCIE CONTROLLER DRIVER
+M:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
+R:	NXP S32 Linux Team <s32@nxp.com>
+L:	imx@lists.linux.dev
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
+F:	drivers/pci/controller/dwc/pcie-nxp-s32g*
+
 ARM/NXP S32G/S32R DWMAC ETHERNET DRIVER
 M:	Jan Petrous <jan.petrous@oss.nxp.com>
 R:	s32@nxp.com
-- 
2.43.0

