Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED983B42E0
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 13:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789736524; cv=none; b=aIMyQj4DRVdjoWkQl40h4rkGoQq+gv3sbR1XC5ZHexfiu3pfvf/6bm/qdZkxY10vhcjxbRRFhzIUAPwrIrKIaSntJ0l6xo/ic4wGqsd6j1ogkKQfpJAYhlLgw+S+hORLDsgA5EE0u4rZitcYDe8Bo2MLZws4rWRqss2rfNH2ABQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789736524; c=relaxed/simple;
	bh=fa6kq1q/j0kmHwk4URxaYOv2Xe357GRD8EOADLztHbM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tnDnnSQknyNBbg8kEt39+StwTuLjigWmPJ+02iIiwfqnbITv5iYtapq6PCIC95axJz/YR1AxaWuRjX3b7u2e6lQGbyF56finp5BFAWoZ7RIYEQMEF2Tbl9106Tnqdm15IDtdKX1L5YU0oa8pd7MPUHEHs/RjZouaAYvSIJ3ryIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=Y2U+gj2k; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="Y2U+gj2k"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so4126455e9.1
        for <imx@lists.linux.dev>; Fri, 18 Sep 2026 06:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1789736520; x=1790341320; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZtkHI/KnMWq6CTlHyr0XTNdYgawafpLs2G6PQA3uwQY=;
        b=Y2U+gj2ka5TlMqEdsTCT6RETYg1rQkmOtbqrUM7KST8cffEDyxDmMqbURucj1tkYPv
         Eo6qsCTVbAOb7T4monpSrP4pUT+E+xrmFNMuLqSVHGYP8qGhdfRwFknQQ90OnSZ3ikQt
         DOI2wq3oSmLuko1FnZvcWtjUcXK79Mo/Sajd2XO3Mei2ydvdE9a/8i3vu0BpgQp3Q401
         LIAiwVn3xPVTBuv7aMAXngwCc7lXWUyKPHAvQ92OKV46W84YRnkJXPU9Q2S3QxDV2hIU
         Gn9b1gDPm5q+xslGgCR+6IypafwbtyFByUfDpeCcfnjMKvdcBiips3fwHdHosCABADjZ
         VhNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789736520; x=1790341320;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZtkHI/KnMWq6CTlHyr0XTNdYgawafpLs2G6PQA3uwQY=;
        b=gaHXDtrnYjB3PyqFTSxmp+w6C1YK3NZZ5UUx4Hb/urPsEc9OvtYB2HD4mmrZRLDibx
         xVMcM2Mliz0Xa1sLiQfIQ5Ql5R1DzgUOKb2rCBY1H2yIdlo9cGPEbELP3I9oji5gSp1B
         /zOYOsYZJI2/U3YiqdnulltZEM4fs6n0OwKiKSJxqP7bvpQsPkM6pvVdnYQnqhvMk4Ds
         Chs49ivSpnyLjkPobyflDHfdCfBfJxA+V5d++5XtD/vpu1y7srbMfR+4SzD4K7wKfhzE
         XRRPQUV4EK31+sKXR8oSS6svJvHKDLSXOYVIT0dN38dRHjLM5ZtvddiPhziGm1mBA7Tf
         G9tA==
X-Forwarded-Encrypted: i=1; AKwUvBwf3ab6fB2sMJl0OaQ2tdKvvzwjT5jR0QFetZKfjjtSrkyOZ8Uj9cNjJjOw6bJXPmQKjIc=@lists.linux.dev
X-Gm-Message-State: AFuF++mJ1Dy1gYPxxdQFOeRjMg+JilzVUfSy6bhtrB9Y0pLEBqMWFts/
	luSodf4P4GcvxLNQHQtqgx18N5idOUCZcNncw9kOKE4zWcCcs524gUwnM+jVsHi+6Sw=
X-Gm-Gg: AYBFou3DPpptCfi585lqxV0xJzzmUz5yKTI5R0PvIUfzt9v36OoHMSWITIcdyWimQ2w
	4uMbbnnDnbHD5cvNGYJpMYnJ9gO80GOyf5VgHdzMy15tspx/cfU3j4CwAprKg7NDYpriXSXSGxK
	YwbnSPsQd9hv85x8yWmpfHORsp3mwZ5IFMffS26CBC8QRuDAyTy+RQIQw5iZ94lyFzbPbmBCtrO
	Y2+J4wl18LS8KXOrkLQa56I+/4U1qtoVBOIQEFXPRIS97FhAVFYupubdGZm/FDV0/idX0Sa6DGE
	tNIyhvBleq2Oh6Oxs8FAXebMJIoKQqLmZv4PMhYHxRu8dOyIVA4BHZxxwcOQbUNJoYvQ1dVnexw
	fbpUVt8YKyICuSJHz/q0o0iANrHIrJO5qxB9pb3q9R6i6PktW79eosFGEHLdFcvNBYSmxwhpjW0
	hPhSDOYsztkGjr00ai7KPvSu/w63prIIsRNnkRdHpqbVtPJz2+9GR86Jwc43jW7DeOH4zPpSRN+
	H4vGdNsCqaYgB8=
X-Received: by 2002:a05:600c:1f95:b0:49f:bcb7:8e9 with SMTP id 5b1f17b1804b1-49fc5726c1fmr60894575e9.9.1789736520206;
        Fri, 18 Sep 2026 06:02:00 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:767:e33f:e8e7:bc85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd24034esm188663345e9.15.2026.09.18.06.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:01:59 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Fri, 18 Sep 2026 14:01:50 +0100
Subject: [PATCH 1/2] i2c: i2c-core-acpi: use named initializers for
 acpi_device_id
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-acpi-i2c-v1-1-caf4bea4886c@thegoodpenguin.co.uk>
References: <20260918-acpi-i2c-v1-0-caf4bea4886c@thegoodpenguin.co.uk>
In-Reply-To: <20260918-acpi-i2c-v1-0-caf4bea4886c@thegoodpenguin.co.uk>
To: Andi Shyti <andi.shyti@kernel.org>, 
 Mika Westerberg <westeri@kernel.org>, 
 Shyam Sundar S K <shyam-sundar.s-k@amd.com>, 
 Elie Morisse <syniurge@gmail.com>, Benson Leung <bleung@chromium.org>, 
 Guenter Roeck <groeck@chromium.org>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Devyn Liu <liudingyuan@h-partners.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Binbin Zhou <zhoubinbin@loongson.cn>, 
 Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>, 
 Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, 
 Ard Biesheuvel <ardb@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Israel Cepeda <israel.a.cepeda.lopez@intel.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Hu <hanshu@zhaoxin.com>, 
 George Cherian <gcherian@marvell.com>
Cc: linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789736516; l=1626;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=fa6kq1q/j0kmHwk4URxaYOv2Xe357GRD8EOADLztHbM=;
 b=EYFqwB3JTSDF/v6810RjGhnD5BuvCmTHk4T0POvMYduD0+qDSn25FQg7BXKXC7O8I0YPInY/k
 wW3a/ein6rHDASDulAEy/3FhDJTusf+soHqll38+PQvEAnd5Rrg6OMI
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base. Also drop explicitly setting fields to 0
where it is redundant.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/i2c/i2c-core-acpi.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 8f3bdd50186e..5161e8a7ca10 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -352,8 +352,8 @@ static const struct acpi_device_id i2c_acpi_force_400khz_device_ids[] = {
 	 * at 400KHz (as can be expected of any recent i2c hw) so we force
 	 * the speed of the bus to 400 KHz if a Silead device is present.
 	 */
-	{ "MSSL1680", 0 },
-	{}
+	{ .id = "MSSL1680" },
+	{ }
 };
 
 static const struct acpi_device_id i2c_acpi_force_100khz_device_ids[] = {
@@ -371,11 +371,11 @@ static const struct acpi_device_id i2c_acpi_force_100khz_device_ids[] = {
 	 * the device works without issues on Windows at what is expected to be
 	 * a 400KHz frequency. The root cause of the issue is not known.
 	 */
-	{ "DLL0945", 0 },
-	{ "ELAN0678", 0 },
-	{ "ELAN06FA", 0 },
-	{ "ELAN1300", 0 },
-	{}
+	{ .id = "DLL0945" },
+	{ .id = "ELAN0678" },
+	{ .id = "ELAN06FA" },
+	{ .id = "ELAN1300" },
+	{ }
 };
 
 static acpi_status i2c_acpi_lookup_speed(acpi_handle handle, u32 level,

-- 
2.43.0

