Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5A83AE185
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 14:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633369; cv=none; b=Ng+941yWZJghrHzgWxxPObjNSnz2FfOnLVLQJoeT6pWO1FjXKJy0Xq4oZjlxieKE2cuOOQgWzKJPD/f8vt1Q2n8MtJ6hfCIHCRpyZMlQ/wYYGZW26Gp+Ne0W3G+WIsaFoLypzJjOhv4R8cCsV+PZwH18fcaRY3jXqEcyoKgosos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633369; c=relaxed/simple;
	bh=BgfoZYz1aliRBDgJ1DdD/5E6heRlZbhIb6uE6aX6V8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g0JAjo5KP2nDmDSwYRoW5bELtnigpOWSBAXfwBmpypt0+AsP33+rdx1XpONSGtFnYHn77I+XDojOYHXP6uqYve4sn0nahx4NXTgLfFR6f9a3IrhRnxKxfun4z8VITcXOmt4QTOIlIUfLYcndymIdaLPh+qnfIhY+yULv5lluHA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L05Hbx+A; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L05Hbx+A"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82747396358so3571648b3a.0
        for <imx@lists.linux.dev>; Wed, 04 Mar 2026 06:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633366; x=1773238166; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrS7ZIa0rilgM/jlzfLJJeKLRZ0Q0OYSRBkIhGwwFqw=;
        b=L05Hbx+A17cvDG0Zvhd3Pbt+RLYgMqkHA6ew+pZI7/7l6TEiIvJgEDLaHJto1kDMHJ
         1T0ApItjVVWxAjzwbki6vptI78s8KDOorrK825n988wAzMmXJZpTWfDDbcoVvBTWet6A
         A9Cs6YUwQeNNLl/q3DC2e0G2OgpqcaFxPksQL2z3pORCXCRNfvofWa2CZp2oyUwtfLny
         DsKGfD0mb/3/IQCC8F7RhByt1zRtgb9BPjKAdGkKdD3srZLD6aIh0kuFu2Mb0HNc0QKK
         aGm7gYT5MGK9DmLOi7aGl/J1MB0LFtFB2u+5iNFEEAmjAJvTipc/iTgiP92nYTkRtY8I
         J1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633366; x=1773238166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mrS7ZIa0rilgM/jlzfLJJeKLRZ0Q0OYSRBkIhGwwFqw=;
        b=K1CfWUg7OS2N9cjmqHd96w3oyJMUOah8uLDSN+EvmL1nUS3CckofRkzQdfXbXVY+w4
         R2yWeTRU5yt6XTZ+S5lDdc8FG8D74hcpEgtNLO/3rwCu/oGBNfg5FkScvr1ssvrz3djz
         7l1JG+B/nrAFc3rtKeRFxPVmc2ylfQ5+duN/vDiEoZOo1m83vkT6BezLSAAecnIdKd8n
         tmRLIdg35wKQU9HnfTrdf0GaNl2kBUU8H9PthRXhkfwejZ5dXNbRWq4laVz5FnNQDKuO
         c9v/zjMfe30OxXzS0AXy2Q4t4mqHv+u5zmG0Yy/Q/hYaYdzu5gRXLEr3mdI4ta9g4VxC
         pa4w==
X-Forwarded-Encrypted: i=1; AJvYcCUW7rdJ+xZS+ACkfj9im0RPUdCSq6hewOSc91SiqGhrAG1kO8b79z37WQQ+YGyuJ2a+TIY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxBWPkDuNV0N93WEtPy0C0DJfI1C1Mx/NZ8Rr51Mcfz+9+4EK6o
	iKlzKF754Y5dj4/qgJooQmRV6F2cbu3ekTuIIIphvMhTJYtZorUIw9A4
X-Gm-Gg: ATEYQzxTn8t8PielPQAqouCd15C4NdkZRKcXK9iEW+6yZuxmJzcQIEJd1auG3arIWT6
	Hc3jDJewmndFXJCJ2lbVFcFqyXAZ8XNsL+b/rMQH+gVP8OFEO9sFYoxtJabUS0l8u/nIO8vp6SJ
	klHPFI5tljuz3C7ox+WLIMtWMleNtR9SSju+ryYDtnShV1gbCPOZqJh2Kq8je2SFSfWpAREj+Aq
	BY275XsMsFZlC9bTpAYmq91EPw6eoBcVquj7nc2gLUglzbWtKW1o5pVkauGTu3sNf6mw42oRnaa
	8KKDRp9A2IAHhJXQamO3D1E8lbgWajqwUJ8W6Xjnd1zm7PpW/8INQG7Q3uml5Y41LdTWMghPiGj
	ubmecE4jNGX1KueN6IPM2pBTGvs3EyVWcEOJqGEclKEWg86nMkFXEMA+UsCG57NxGJzXljdY//N
	3fh3guHPFGDhIm/4rgfdQY
X-Received: by 2002:a17:90a:d00b:b0:34c:9cec:dd83 with SMTP id 98e67ed59e1d1-359a6a7a0a3mr1687183a91.27.1772633366451;
        Wed, 04 Mar 2026 06:09:26 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:09:25 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>,
	Roy Zang <roy.zang@nxp.com>,
	Yue Wang <yue.wang@Amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jonathan Chocron <jonnyc@amazon.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Paul Walmsley <pjw@kernel.org>,
	Greentime Hu <greentime.hu@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Chuanhua Lei <lchuanhua@maxlinear.com>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Xiaowei Song <songxiaowei@hisilicon.com>,
	Binghui Wang <wangbinghui@hisilicon.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Niklas Cassel <cassel@kernel.org>,
	Hans Zhang <18255117159@163.com>,
	Koichiro Den <den@valinux.co.jp>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Nagarjuna Kristam <nkristam@nvidia.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	linux-omap@vger.kernel.org (open list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-pci@vger.kernel.org (open list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-arm-kernel@lists.infradead.org (moderated list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-kernel@vger.kernel.org (open list),
	linux-samsung-soc@vger.kernel.org (open list:PCI DRIVER FOR SAMSUNG EXYNOS),
	linuxppc-dev@lists.ozlabs.org (open list:PCI DRIVER FOR FREESCALE LAYERSCAPE),
	imx@lists.linux.dev (open list:PCI DRIVER FOR FREESCALE LAYERSCAPE),
	linux-amlogic@lists.infradead.org (open list:PCIE DRIVER FOR AMLOGIC MESON),
	linux-arm-kernel@axis.com (open list:PCIE DRIVER FOR AXIS ARTPEC),
	sophgo@lists.linux.dev (open list:SOPHGO DEVICETREES and DRIVERS),
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-riscv@lists.infradead.org (open list:SIFIVE DRIVERS:Keyword:fu[57]40)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [RFC v1 07/18] PCI: exynos: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:50 +0530
Message-ID: <20260304140329.7089-8-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260304140329.7089-1-linux.amoon@gmail.com>
References: <20260304140329.7089-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Establishing a PCIe link can take a while, allow asynchronous probing so
that link establishment can happen in the background while other devices
are being probed.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/pci/controller/dwc/pci-exynos.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index 0bb7d4f5d784..ee2423e16b58 100644
--- a/drivers/pci/controller/dwc/pci-exynos.c
+++ b/drivers/pci/controller/dwc/pci-exynos.c
@@ -388,6 +388,7 @@ static struct platform_driver exynos_pcie_driver = {
 		.name	= "exynos-pcie",
 		.of_match_table = exynos_pcie_of_match,
 		.pm		= &exynos_pcie_pm_ops,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 module_platform_driver(exynos_pcie_driver);
-- 
2.50.1

