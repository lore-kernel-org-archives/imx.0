Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795581437;
	b=kbvUU0KFApmQI51ac8MS3UwgUtKlJrCzhjq0SDHxa3TQOo/+sIAX1ticCMi53q/kCB/M
	 10Xp1qJBa2LtsUQQ0CJgcOPwJyP1WqJVhRTMJ/QwL4Z7Ay9vo0VAI7lhvkVno0p/umpKS
	 IlwRrxj74Fve1GTh7dprSG01vzExp8XBh5v+eKF3pJLPTtLG69Bv26n1836mhego2Y9h4
	 X7qZt8SD0djRmACtOMin+r2AGXoRlh6e/IxDOKiVR63R0ofA+kcWyMEr/BqT5KGhbvpZO
	 JwgOkSdn4Juppr3N8JDDIgQNTPZwwA7OtpTGU9BwJeUNby6aWbS4x+4WNA4zA5a5J3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795581437;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6DVyoXA6Tib/v85orEHsRlE+EW8lKD49gIz3qCv+SNo=;
	b=IA4v2iQVDMQ/BI6Iu59HCGxOZ6wFuCNU25TDCI8mWvgGEW01pJNPH7rzZ3qFJFlT6fkk
	 CXR9HiBO2WzQf3QXcjtlTjNoyAgt07/ISIkNaWDPocHgbTTxZXtLYC00k4AYIZOl3x1Iv
	 t2rCqvWtx8yH2FISQJmXcb/FEr8fc6b/Z3g2Z3fOKkSoczzrVciu0M6uyBBdnzK/Shzb9
	 MwBsITbz5B5nqNNdsilpUj13YiuuBrfAgi7XfVtWn2Ve99Ems6C1gWDfwZVAdn0E1c952
	 op0SLrnLZAdbYdW9YOeeOnER1KHANdtdp4tX1vaNtQsKz8H70lAmYCwrHY2Nv4VkfWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wKwh5kgz;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E57606A321
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 04:37:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27E57606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wKwh5kgz
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a9f9473029so4006751b3a.2
        for <imx@lists.linux.dev>; Tue, 24 Nov 2026 20:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795581436; x=1796186236; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6DVyoXA6Tib/v85orEHsRlE+EW8lKD49gIz3qCv+SNo=;
        b=wKwh5kgzmKzCnaJTj9nqU4GpG0UasEXp7L7onPBGqzQ4s5hrx0rhAOzDPVWz+XWTsf
         jlO/GIIyZl6DmRsDud1VzFXcqnXeXsnXhbCFfXN1GQRt456ydUDNs5JrzESlmBpZ51Ej
         7XJMw4rD4wt0LAkncV36DW4AI2qZoSqiqwfN0gb62uU/5qiCdTIoVeg/CfuH8XpX6Va1
         shR4XpF76HuRpitPfSb7QmQJkIqFk1YQ56hjifkSAUpVwMZpCgUlX/memZiIzQBYjE8Q
         8Gb+cfy1jPhhgSxe379Cp/eqEYJby7z0AG8Cc7UhgQQc66Jgx+Aef8y0BTleNYJHXUb6
         hu7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795581436; x=1796186236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6DVyoXA6Tib/v85orEHsRlE+EW8lKD49gIz3qCv+SNo=;
        b=rwe2UuTB+vvMDsGAYl8PoSPSfNN4zI7zZex3cRzzUL+EMwVCU+eaJuskyNeDqp9yBq
         N++A6mLmlTmg2Yg77eznYINTE/EgmbCPwCYdsWnR/bRzCxhNqNwsYdaxSUwyDLaHXOhv
         FLzxtitICKUnPVerC7lqnCmcXPaNpQJsuBekf7z0FPt1eWY33c3PKiKlOQMIwWSVkROE
         26axbNzrE/1UwiGKTC0gUsZMhb0XBaEdtLHep89Gn2TJT2PTLaFP16lE2wvHUCT2LIG3
         uJ5spLy3brtma/8beZTs8Iy00O6pRF5DqsjL6f9tz2xNIOLkvmX8OUpjQYKiKrpqdn28
         ts2g==
X-Forwarded-Encrypted: i=1; AL+hErHyd5L+2I1VZawuGUPb0nhGooZlQb6GJ8NijywuiHG0ebKq+Uzob+ACtNZHf4g3g7XEi3s=@lists.linux.dev
X-Gm-Message-State: APuU4Z/vlDyyOsk6D8wBM/yRm+R62bNcujrSfrvtQcfoy3DciLZTmQge
	MfSjsRen9ww6d9OdtGwz0dZ6JLEO0T1NLjvGtEaQZg3R2Lwtz3fyTGMt
X-Gm-Gg: AZFdTZcD4nGuK2KClhlQSHHVdCnJIOsMiOUkvJ27N6H5QYVudATFRifS4gOPFzIxQJi
	zByuL3ZHiAIPU3hHh7xjt8ilUwSJvGUmLmaVLquR3/QwHQyGGOhFQX8320rftBqHH2Ic0YOdgE/
	2yMrtvt8OzHJaxbe9+M8aDTKsfDvhiBRTLy3HgyieTPaBz4KVjN78wfHACNiHyCDxexi8RYS3yd
	LqG/7MLVtEEVJoCT3ACqEyFBU0LTJEeHRegZW/WCKo6IXbfZGW51zWYKaxTK1vgl1WcZZbvIHQp
	+SVu8E7H+ksHiaawLgnqHXG6PDC4hzR9l+GWFK0BgcpBXecjAu+/K8roVVQmgXZvAnSqj2qO5hY
	jJ/+wuGJAsm/HN0SrHiCiw5bHex1NVcy45/nzdHO768ehaRURIYlxGyvfZZwopGxZ8hZzPZu4mH
	asjKVMNN1OZMta3FXMUWDLq3AHVZFx5OHN1wME0SaOsRz/AS2ek+zlxR6NguFzDFooT0oP9ZM04
	lA6jsJcxWsMXVLa47UI/DX6CQm2I7A5chrPv7npCsDorqgwpfDornZGMDN9+DHHIFajyNG/xrYX
	ze3z8Za5QixljU+OFUsN55p1IdCK
X-Received: by 2002:a05:6a00:3998:b0:8a0:5da1:2264 with SMTP id d2e1a72fcca58-8c87d2289f9mr13508087b3a.47.1795581436417;
        Tue, 24 Nov 2026 20:37:16 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f83dsm8178515b3a.39.2026.11.24.20.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:37:16 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Aksh Garg <a-garg7@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Rhys Tumelty <rhys@tumelty.co.uk>,
	Manikandan K Pillai <mpillai@cadence.com>,
	"vladimir.oltean@nxp.com" <vladimir.oltean@nxp.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Hans Zhang <18255117159@163.com>,
	Yao Zi <me@ziyao.cc>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v5 0/8] phy: core: Add phy bulk helpers support
Date: Wed, 25 Nov 2026 12:36:31 +0800
Message-ID: <20261125043639.249525-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As discussed in [1], some drivers may do not care the difference between
phys. Instead, they only need to treat them as a group and operate them
together. This means a bulk operation is needed.

Add some bulk helper functions for phy core by referencing the design of
clock/reset subsystem. This can relieve the driver owners' life who needs
to handle many phys, as well as each phy error reporting.

The example consumer driver is at [2], with the following function used:
- phy_bulk_init
- phy_bulk_exit
- phy_bulk_power_on
- phy_bulk_power_off
- devm_of_phy_bulk_get_all
The devm_phy_bulk_get_all() is also added as a simple wrapper of
devm_of_phy_bulk_get_all().

This patch set also includes another two porting for cadence PCIe driver,
and the the IMX SATA driver, as I have the document of these two device
so I can verify the PHY timing requirement.

Note:
1. The patch still uses -EOPNOTSUPP for dummy blob. Instead, I send
   a new patch [3] for fixing the left function.
2. libahci_platform.c is not ported, as its getter require additional
   check on the DT so it can no be handled by a simple bulk get.

[1] https://lore.kernel.org/linux-pci/ak9KzNFF26B0Kttz@ashevche-desk.local/
[2] https://lore.kernel.org/linux-pci/20261125041523.242588-1-inochiama@gmail.com/
[3] https://lore.kernel.org/linux-phy/20260929084739.467082-1-inochiama@gmail.com/

Changed from v4:
- https://lore.kernel.org/linux-phy/20260923023304.78428-1-inochiama@gmail.com/
1. rebased to v7.4-rc1
2. Apply Andy's tag to patch 1, 2.
patch 3:
1. Add this patch as Andy's request for simpler bulk api handling.
patch 4:
1. Add reversed recovery operation in phy bulk operator APIs like the
   reset subsystem.
2. Use int instead unsigned int to simplifiy the error check.
3. Fix wrong error handling in phy_bulk_get()
4. Fix document of the existed bulk API.
patch 5:
1. Remove unnecessary num_phys and device node check in the bulk getter
   API. Now it expects user will give a valid input.
2. Add devm_phy_bulk_get() and related helper function
3. Add devm_phy_bulk_put_all() for future porting
4. Make all dummy handler follows the same semantics in other subsystem.
patch 6:
1. Add missing doc of the all function
patch 7,8:
1. Add these two patches as an example for phy bulk API.

Changed from v3:
- https://lore.kernel.org/linux-phy/20260923023304.78428-1-inochiama@gmail.com/
patch 5:
1. Fix spell error in the document.

Changed from v2:
- https://lore.kernel.org/linux-phy/20260904083709.425893-1-inochiama@gmail.com/
patch 1:
1. Add Andy's tag
2. Update comment for phy_add_device_link
patch 2:
1. Add Andy's tag
2. Update comment for changed function
patch 3:
1. Remove all unused function and make the dependency as static things.
2. Update comments for struct phy_bulk_data and left functions
patch 4:
1. Remove all unused function and make the dependency as static things.
patch 5:
1. Add phy document for these newly added apis.

Changed from v1:
- https://lore.kernel.org/linux-phy/20260831025319.94886-1-inochiama@gmail.com/
patch 1:
1. Update document.
patch 2:
1. Fix document format.
2. Fix several document description.
patch 3:
1. Split into two patches: one for non devm helpers, one for devm helpers.
2. All the bulk helper now use unsigned int for counts.
3. Fix multiple the while loop statement.
4. Rename of_phy_get_parent_count() to of_phy_get_count().
5. Fix some 80 line function problems.
6. Use PTR_ERR_OR_ZERO() to simplify the error handle.
7. Fix zero value in the document
8. Use two separate release function for devm helpers.

Inochi Amaoto (8):
  phy: core: Add common helper to add phy phandle device link
  phy: core: Add common helper for get phy phandle by index
  phy: core: Make phy_put() ignore NULL and error pointers
  phy: core: Add phy bulk data helper functions
  phy: core: Add managed phy bulk data helper functions
  doc: phy: Document some bulk helper functions
  PCI: cadence: Use phy bulk data api to simplifiy the logic
  ata: ahci_imx: Use bulk PHY APIs for calibration PHYs

 Documentation/driver-api/phy/phy.rst          |  40 ++
 drivers/ata/ahci_imx.c                        |  57 +-
 drivers/pci/controller/cadence/pcie-cadence.c |  62 +-
 drivers/pci/controller/cadence/pcie-cadence.h |   2 +-
 drivers/phy/phy-core.c                        | 546 ++++++++++++++++--
 include/linux/phy/phy.h                       |  69 +++
 6 files changed, 648 insertions(+), 128 deletions(-)

--
2.56.1

