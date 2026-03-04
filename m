Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D139178372
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 14:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633658; cv=none; b=jwMlkapH2Ku9hx/lYNa3v4G/wF5AneYzAHx8DmYtwNoe3xOxBf4bNUDquR8kj7UVSbPAZxOIo0U4jXPouLFn5hPaM/Al6rQtUaLzb1pD44Z+V5KQqsZK8VUV8/k4QePNccat/8uNNu1FjRPb13jANfoiczx0O1SQR4Lf5VlbhFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633658; c=relaxed/simple;
	bh=usU4AsKxYiL9wPQdX55tLEiVuRtsJkW47W4gt0QH30A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FRILGSoKBUc9iXhzRP7IjIFKXT14KkRhfS22kFkT8p2wguxWmwe9zLAHhulzvFozp/f2+A6CsKdVCme3xmq9afaDTo/plnWkvTTrihyPuwvHppR71vlUf12HhBkW1kjQ1EJ4dPd9bWzb72GMzR+NRI5tzb6nd/OXFax464OLRgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kgePfL3p; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kgePfL3p"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3598581ed7bso1408190a91.2
        for <imx@lists.linux.dev>; Wed, 04 Mar 2026 06:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633656; x=1773238456; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/iMM5LSmFDPAj9DIWsk4fCcz5M6Z1n4D1h8BmNreiQQ=;
        b=kgePfL3pCcgwqeQ7Tf3PCC2jx6vAGsxP4IOh9rUW6Wvn1kCsiRAfjOHQC8x1xCxsmt
         NAAM2itQkfr2Pn4MlVDC4e09kdJlHBcVMTp8lwvOjGcu/6yweFQB2KlUS6pSdRwPy5Vf
         sWuNxjmuYN4mzkVy3UEteuRZk5cb4bEXC75nTUqUA+Ppm+6LShz+J7RNdmqodNZiwfh+
         qBxmk38emOm6Bg7re1JE9EBg6dAfy5PNB3CoZ5xtwcocyGRYSoAjfza5ryIzxmvGA3fx
         cOwwy4Aiv/p9clsMv7NgEawwDkzeJOOt9po94WgQmUamfsg0vWB5UJI+TpT6hcDE1tOF
         HyBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633656; x=1773238456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/iMM5LSmFDPAj9DIWsk4fCcz5M6Z1n4D1h8BmNreiQQ=;
        b=I+3mSnNG2DXf4ULsgVUXPRLYEktjQ0pGPhn2NjbLZcuxjE6bAiBPUiFI11koqGJmgw
         RFxd2e/HwQ82NXzIsWj71Cw1QOdnqFaiWwsXalFSJP/GDWv7BOCT5YojILybkVRbIun+
         DwY8W3JIsDj37mkbAc8D+dFtJ8QhtsWmBGSDlyEiOLPcaMeIqoBJEj2VgYp3ZkHxCb5O
         x3JK0W1t6panhh2HOYKbyR/j6IuPhI4B8FeDjcHgzg0yw1wUjPd3rYizneWpyRNexF9w
         cvb4mw3T2f13x3ZDfjeX47gfmJ0d6L5M9g7lQNmW7xZzh468NuPTiiEIrVHd02hmIToQ
         7mCQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1oY2yFWW9sEjC3vum88hnt0/wDbL7qB93GD1HpwYqJjcOTukRYXlO+OM8NIfxfClbbQs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzCf4W0VHMM+5g/gJycYwNdmEWISaGtc9ej4ErpLvwcLS4HKU3H
	W66Y8QTw28WBTA5EhEAR5qkgeHXjl0mCI8ZrATrqYTYIlFT6NSB8WXSq
X-Gm-Gg: ATEYQzxaDzEYK6/Dxue3gmfwU58ttq25lbdC/YtOwsWInaz9wAvEPX2UWP4snljg4gK
	9ZHntdMl1WY91yDQYJSrvw5QJqyao8m1IvIqvzMHWwoCpqZ3kWeztNKGYienCKHgdE0h4ugyAwi
	o+614ox5mmADjZI2o2ALzOTVGgOzH9QUakTPo0/dBYcGdbYAEthT7UbOVWsIdxBnYZzPaESRiLc
	lpT+Oma4MJv4Ipoq8YnW1A/U456p29cENBx5dpC3IAelW8gPoGzMaYWuAL7LedHHiLZDn6oAWwX
	kcsf9MAGz6DnKbuMpKnbOpr+kEXMqUrr/TP+0uySa13dGCkvdrZ6HFSndBc9noa7sur5QoBGMC6
	hXdt/MBQ5AXB+DwvTJ1OJHRoxr7dG+Nv2t54JyRzjeJ7pZJpixjKZ4peDWJSbzjz9oQHaW+qlF9
	Lv09MUbAZn2FwrXnZmMuFI
X-Received: by 2002:a17:90b:278e:b0:359:8632:5e39 with SMTP id 98e67ed59e1d1-359a69adc3dmr1844903a91.5.1772633655971;
        Wed, 04 Mar 2026 06:14:15 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:14:15 -0800 (PST)
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
	Qianfeng Rong <rongqianfeng@vivo.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Koichiro Den <den@valinux.co.jp>,
	Hans Zhang <18255117159@163.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
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
Subject: [RFC v1 13/18] PCI: layerscape: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:56 +0530
Message-ID: <20260304140329.7089-14-linux.amoon@gmail.com>
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
 drivers/pci/controller/dwc/pci-layerscape.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index a44b5c256d6e..43a28d9ea7b0 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -410,6 +410,7 @@ static struct platform_driver ls_pcie_driver = {
 		.of_match_table = ls_pcie_of_match,
 		.suppress_bind_attrs = true,
 		.pm = &ls_pcie_pm_ops,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 builtin_platform_driver(ls_pcie_driver);
-- 
2.50.1

