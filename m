Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6C13B892F
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 14:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633174; cv=none; b=ZFKryjcFP/I/a4BJTHNBh+Bwjh5A8Bqt4hCsVmR9M4GCeEsSHn0pylc+l//kmuHgLsxCiilowCK0pqECx9BXuX2ozdlgU2HBPpBZ0WoEX4gILvTUVtghNnWOBbeMxuFM4Itb/tl0y4eE6tNLRclvL1CGDzEAmeVr6q38+RtFDKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633174; c=relaxed/simple;
	bh=IoX1lY8Yyzmbm1I9IV2ELUEQxT0pxCd3QQREluW47Gw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q9KQzX0NRDBsX8wHsWH1C89y7KVX9uRWnofVgFqFYGNch/icObUDxc6RBhgnh8a4ceVhCJu9W1eN8Q9FWt9z80sQ9Xz+pX+aWOb/C5kkl7QKvmjjXSwLi1lIaMl5w/0EsdChuvK8BrrQJqQ7SuvNwua1WZ5QAzQWgGsjWpewszo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RoLm9A2A; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RoLm9A2A"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso3049129a91.0
        for <imx@lists.linux.dev>; Wed, 04 Mar 2026 06:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633171; x=1773237971; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z0IbpkKbOUqAD3sb0v/7e7VSuY+QqYVSN65hjbLO7Ig=;
        b=RoLm9A2A+CEmLCytIlQh4obuoVzD4UZniT/xlODZ91PZ5MYHFwQ7aCAc28wbsQKPgu
         5sAaq8wUjlhWcQgJnFChAgbUWTLy4dvEB5jNgl70Qaw8IngPkA8KkkPb4vPoPotu/eW2
         DfGU3EgHlTEliRIrl9L0CCMuAmpeGbtvXiwPZGbEmn+WFzi2eASuhnj33vsfcmh2xKNf
         w/GmZi0jP9A8movLv0Jn46LTrjFSv0kWzuS0wZ9QBlPmqrwdE9Qv3rGUbpPyhE9AIajx
         tye0z5WuteB120PteWrUaY4DkKYQpa7fnwiJ6Nff796JqwMa3lQgduxSYo1l75vAaU5s
         7a1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633171; x=1773237971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z0IbpkKbOUqAD3sb0v/7e7VSuY+QqYVSN65hjbLO7Ig=;
        b=LpUloZ53ZAGjyYkjgt0d6yob85oqsc2huBkGOSVLZyLoJ6bLNtKh/K6Nqov6Oa9MIg
         ljtQGhdA5HhOfAPEr0gQRxpmydyX5IrxA3Rs9qnpJUwytEHJFAdc9F/ayPBhkf7LWGP4
         KV4T+ZrLosa3Ykl/tJXDER7WEhya5iGqHJ0UgBpjwC0tfv/hj2bJ66eWrr+D3mijfxys
         burDBrHQeP6DxUA0nnrGpbliKF1GbSq+HYCYo5ruK3mK8Hr2PMlGGX9Q9hXuzXCcT8Q6
         NDII+KbnbwCyLf8q0YP6kSWW9OCZCWFm/Nyb8bLRovzb942VA+x/dUTTaq+mIDeSPTW8
         ScBQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2CXwWoIqN5gNNoPEFIM7koc1PD44JO7DR03IJTJXejs/x+fGhRqIcxLPPI7k12/v07Vw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzLYoLlRV/fgBKyr0xc6/TNrJ1CXShflQqhhNbFC+hJkR5Z5Hxu
	z4Q9skLHNyBetv2DbkZfcfzPGX3nAKKV8IHsTXHd22mcCcVQZF3g7qP9
X-Gm-Gg: ATEYQzyCozS0oYkJgaosL3CLSpXqD3aq3cxx+1dO6anY+zZW02zrQYNYPma9UJ7dUVO
	wbFHlvuZfnwNm1IPOx2J+ns5/Y6VIpl1z+xeUFvTcw8gjxQ2BE12SRT5O+L3u4t0M2ppT3DE4nw
	vFo0d+FAgwn1QD2FWpIze5cQlt1/vt7qw9Fa+qqscYyhrEM5+8rurw3a2doCj/7UG40SUWkAm36
	59yR3azwyz97AOKsCjripYQx1OD9naSgnOA6PM5h2Clqq+0J20eqNSi4Ok5bxq6PzaTO/9rSJiM
	i8pO8Y8IQX6jqvvZZvGc7hi4/HeJKw8OUuAwfy1aY3IkYxUISmc8AWaZsoccZy3wopApbWE/LYX
	q9Fc+ljemE8eaWR/Fw0oQIefwckpjyT7mw09LK7mXJmJkCbBPS7iuVgYL+VNCIiiokLn7xl9eyj
	Rs67pBVM5NxwLfsEt6UfjEXuSk0kkK0/0=
X-Received: by 2002:a17:90b:2888:b0:359:7906:d996 with SMTP id 98e67ed59e1d1-359a6a66a94mr2076415a91.23.1772633171145;
        Wed, 04 Mar 2026 06:06:11 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:06:09 -0800 (PST)
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
	Thomas Gleixner <tglx@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
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
Subject: [RFC v1 03/18] PCI: armada8x: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:46 +0530
Message-ID: <20260304140329.7089-4-linux.amoon@gmail.com>
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
 drivers/pci/controller/dwc/pcie-armada8k.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-armada8k.c b/drivers/pci/controller/dwc/pcie-armada8k.c
index c2650fd0d458..ffb5554a2a8d 100644
--- a/drivers/pci/controller/dwc/pcie-armada8k.c
+++ b/drivers/pci/controller/dwc/pcie-armada8k.c
@@ -344,6 +344,7 @@ static struct platform_driver armada8k_pcie_driver = {
 		.name	= "armada8k-pcie",
 		.of_match_table = armada8k_pcie_of_match,
 		.suppress_bind_attrs = true,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 builtin_platform_driver(armada8k_pcie_driver);
-- 
2.50.1

