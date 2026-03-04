Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF613ACF10
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 14:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633898; cv=none; b=u3ZVzz1SSaD+T329ChaA/rIZF0/QLEnIicyO745/coNXrKL0JDBzJvs+KRwlBHJUWVYEyPqzurPuqZAqhhLICbg0+S4zzmEAPTd6uQytnfx87yaIGDx7GOnQRyCYcxyc42bblvQx0YK/+3pKtecJTe+7jnO3xrmGa3Bo+KSEpwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633898; c=relaxed/simple;
	bh=MFtn++fehPz2bcYxQs56cfdjtPdPajpg8F67EhLU4r8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ijIZF8yiCDPqrtvcLKcjCXEviT70UQaI1w2pE1x8HaCK85ubX6GuMvE4Vh6jshOsmX5Nbhx2Qy3GRZ+t4JA81zaYre51ds/1qmJXs5zd2bR3Kj8w5nwcxgYQN9sT7T/6kiGFNuZ1xwoWSro5loXHer/5P3rnNOJvj6AaBEHZzzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l9bvVHbW; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l9bvVHbW"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3597b474cbdso2074744a91.1
        for <imx@lists.linux.dev>; Wed, 04 Mar 2026 06:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633897; x=1773238697; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gOqiu9rk3pfbNQbzbq46fMvxLJFiDFeJ6tCyKh6dPNk=;
        b=l9bvVHbW8yVhjeQiNqlYAHmomcrMDssHFx8NdjHaY2KPB6fDveeqsj+7AfrV2fOCIY
         gxrpT7f6CQTNgOKD/tTHyg3Q0MKLJpMm4QrNKXiHh4tpyORWesTqCohCJlQ0zGQ8ZU3N
         gsoX+YQZcpJrN0kE9N4EvNOr9PWrk4p16FEw1TZ5F9M3n3swZw+gr3tX/oCgHZTKMfuw
         76cn7iuIzHjBo54XWrzHLRPmfC8OLwRKybJTB4dsEX4jQ1QRX0VVfuCyq1AFcc1LcCJ+
         a/bBgxiNor0WSSz679lMkkCG12Ajnkd51pLdRLbvP4dY3IjnraaSxphsZLD3CwmEqDuY
         V7CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633897; x=1773238697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gOqiu9rk3pfbNQbzbq46fMvxLJFiDFeJ6tCyKh6dPNk=;
        b=AGNhOpi16bEq/RPVPA1rr9fuTLp+sUB1X+7RZNfzq3J5likSgPO14dZWwFHibs8oqt
         DZecSFc/18HFzmCrpvcRdD57zWeBj1NDp4smGI/9xj1WWRsudSti4TvdLW8NVtaxTPSP
         eyUjXG69+OL1rFRICSDxmQXWuI39fcRm+8ljIeF0tM9NRptezGPRmfTmyE5/ePHA+0if
         OGqjiDQSi09ZzeYnUcHPXFV6snqp7zpKmDxy0iKGWJD4G0tVzt3BJMqWQldPFxTTE5NG
         AhYcEhZq9mL3ZGL4HeAW+9VIsLKU/YxoY7SI91MEu32djgIOLYlzD6jsZyYTeikyD63E
         15Eg==
X-Forwarded-Encrypted: i=1; AJvYcCVboucx9osSSVhx0TkAB3rIqpB7iF/wfHKB0cwbNH16cUoNOXk3pVJ3kvOce7hjZcEFldk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwzfWpxtxRfKd2ol2i2s0RFsQ8HC7huiIj6zBa8LFYyMrhIB0cj
	GwsBwgQbdxXAHPbigW+++tEJmMfW6Gulb5YLOGRJ7g7xaHidIl0n/GO8
X-Gm-Gg: ATEYQzxtiRp4jwRSaHeS6kUNzjurj/hHK+0JP0kdm/8Nh/NT35dNGmGRHStXnhCtYti
	KSgXSgcPmsyh8J+IeRjpkZ1JpennwU4XBQDs/CpGCQNar58be+3amx5w3tO6YrCUJTNHvz9DEwk
	aROkMsX78QvW/0+seBcV2HFr0x0H7zJ1xPSEuXyu902M72c/0afBrJOlXbn6V8AjVBqanAWX4bp
	EC8eajeL72+o6NpdqKBw0KWhedIhOA/Q8+8U9mv6LqU5bk7V87+ieXCJv5e+S1BZl5qg1P3dyJX
	KDAhJ5d2jYlsId83JO+YKq8LYuIYegf09UNsnkHKuCeV7/WeKIyUi+tIYCkmoV5L2ynKK1wkLFf
	K5goCblYfUUGheHFd4CUo2trZqEgoJ5PP/i9DzC8lsRsCgYT/OmX8Pz4HXHYC2SeYdHtYO43rWS
	I9hY0YRQubRXqaX7+nHolXIulAUl4LsVM=
X-Received: by 2002:a17:90b:4a87:b0:352:bdcd:118a with SMTP id 98e67ed59e1d1-359a6a21675mr2061241a91.21.1772633897136;
        Wed, 04 Mar 2026 06:18:17 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:18:16 -0800 (PST)
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
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Hans Zhang <18255117159@163.com>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Frank Li <Frank.Li@nxp.com>,
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
Subject: [RFC v1 18/18] PCI: visconti: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:22:01 +0530
Message-ID: <20260304140329.7089-19-linux.amoon@gmail.com>
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
 drivers/pci/controller/dwc/pcie-visconti.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-visconti.c b/drivers/pci/controller/dwc/pcie-visconti.c
index cdeac6177143..f21cc95fe89f 100644
--- a/drivers/pci/controller/dwc/pcie-visconti.c
+++ b/drivers/pci/controller/dwc/pcie-visconti.c
@@ -324,6 +324,7 @@ static struct platform_driver visconti_pcie_driver = {
 		.name = "visconti-pcie",
 		.of_match_table = visconti_pcie_match,
 		.suppress_bind_attrs = true,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 builtin_platform_driver(visconti_pcie_driver);
-- 
2.50.1

