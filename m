Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75133A5E67
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 14:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633755; cv=none; b=SSrhr3MjliRCGjWZGbC3/ZKzjeW8mvYdaucY56tJsuSX45M9EJhxrEvTRt8ap/2+JmqoWn5OWUxOM6N+ZfB9MO7LD4UauF4NBCWSaLSNelo/VAGo9Dn7JUFaL1aS6ZeNO3EEyAUEC4M5MjnS6Te4adFExaEX5+Ym4I2ig4JJOI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633755; c=relaxed/simple;
	bh=sOuf9crnr+mGWYcFQULXSYXyooM+1ooss5UP7AG6ldw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fEH8exQl4wQG38FJmBMK58F3Wl+TWYlGpsl17zh1ePLh7l6ooWp4Oqlp7qlav6dAherMUeZrglIHQuIoISCBay8FoPXEW/15i+fIYqr2xX0moutF64937bJSH4vv3Qr2jEpsd58cIb02YVXVA3ZRGsod//v/wLf4CDgv51ws54g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eljcQwnW; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eljcQwnW"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3590042fa8eso4155900a91.1
        for <imx@lists.linux.dev>; Wed, 04 Mar 2026 06:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633753; x=1773238553; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CrWSKJRkZKN008VlCo4uVGQadvKlijsjSi8/hdflIY=;
        b=eljcQwnWGVf5n2X5pMhzEsULGvP2ZyBNoZ/ZQTOMXFp5XmU2A4CmawUcGbZszJ49A+
         CrCLRWCYvD1kzIllrw+HvAmMBVtRKZNMFTA8Kt0HocuQYhK/gP0wPj5ypGZ+3hZrWVUi
         qrkSYQ2NOFjSkwmn0xZY0K6xfhg8ExxV9dDVeR1rWAFnoldoU4AnbdGD8scyjkX50rRy
         TVvoL+cd4Oj0pekMd/9grhY+kfTt/uP58XBWU8ArDE6s9z8GZsw2v7NGvGkJuVWpftxk
         gD+q7VssrI9CuTuHcHyypEDIAmjysxBLFl/m8wNUlnRiAI7VTdXafnoUj4V56DD4/w1E
         bIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633753; x=1773238553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/CrWSKJRkZKN008VlCo4uVGQadvKlijsjSi8/hdflIY=;
        b=UJuyb7Rur/WMMYVv68gfYNinVBBSu5Lf43N4DK3tprbBz9uBtqXIQi3dTVGNbTtaOQ
         L/6r4+xUWP23zEDMIwY2YJZpPXJ27Cy/qtmDNSfsy95i+UXj9SEik1w72BF4/AVzNddi
         /Vs0b4YMBzHn5hY7A9haU0t2u+nkn1rwMKOLsPhk5awy2Pbpi7lj1IMlEBnMzH/RybCd
         F3ntyxlBIip281/I/S2Gaq7kZ9ZJQUrKT0Ldovgz/fpymEpbWiDlOgM/Dn5re/CBEPQK
         s31QyOI/FYZkGC4DWHvghuqDu69AWwtv4hXdiv0/P0S047nV+dXM90Mq5vIEQLdFNo7H
         USrg==
X-Forwarded-Encrypted: i=1; AJvYcCWttl+TA6oUheMQqD/ugAWN4ene0ogV30ukRcT8LNaFh4zrvRPZE+YxWp+NPTlm+qoDipg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzygejI9SmsW+kVUfS4Uuu2zWekdNGC/UWte2VQ2pl2LQKJhYym
	e0fRzKBvxLF2a5kBxRb2wKlzfr16FZrttHiOVXh99cPUWyk481jCA31N
X-Gm-Gg: ATEYQzzscwa57PJFkcQ6ubiEfHQPKYxsObVxshEuX5ip7p2dTXNwxGsCg8huP9shPe/
	UiQhlW12QVRV1Vj8pAm8cGCsZqLXWX05MdBQ2D9SoZa0KJ0GgjBlcqlnpi36B7vzgNTC5ZOsMU5
	Wt9eJNdSBgN8XZ1CfvLuyP7r7952U00ebdhldCaDsG8d4Ddr430yIiqDYmoA+/xE485qRpb5qWU
	KiHsH6QNwjYZdm5ZjKnd8PastSwDaHe/ylDXjJR/I2LrQVupRclPxCnIM5lUuPZlusk9xO+jHQv
	0RIosoIQCjgEM8XOxMRBu4UhbES6xbkgaxeDtcyhCFWNMDIyGt4WM242eUYrkdMXcnc2i3vxiFg
	k6S8ZSXksdBBrmRuWJltUMa2Ru2y+SdchiJwgemtigjtXCs0Dc5b1QYvIzzST3XacMod7nHpPNR
	fx5AGK5oTRjkoby3SO8vAy
X-Received: by 2002:a17:90b:3506:b0:354:a57c:65dd with SMTP id 98e67ed59e1d1-359a6a66b87mr2001714a91.24.1772633753114;
        Wed, 04 Mar 2026 06:15:53 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:15:52 -0800 (PST)
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
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Nagarjuna Kristam <nkristam@nvidia.com>,
	Koichiro Den <den@valinux.co.jp>,
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
Subject: [RFC v1 15/18] PCI: sophgo: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:58 +0530
Message-ID: <20260304140329.7089-16-linux.amoon@gmail.com>
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
 drivers/pci/controller/dwc/pcie-sophgo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-sophgo.c b/drivers/pci/controller/dwc/pcie-sophgo.c
index 044088898819..0393f4b613de 100644
--- a/drivers/pci/controller/dwc/pcie-sophgo.c
+++ b/drivers/pci/controller/dwc/pcie-sophgo.c
@@ -269,6 +269,7 @@ static struct platform_driver sophgo_pcie_driver = {
 		.name = "sophgo-pcie",
 		.of_match_table = sophgo_pcie_of_match,
 		.suppress_bind_attrs = true,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.probe = sophgo_pcie_probe,
 };
-- 
2.50.1

