Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3101A32D0F9
	for <imx@lists.linux.dev>; Fri, 28 Nov 2025 13:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764335515; cv=none; b=DRhaKqQ5cZ07L0sI0D7BqfVhf5gCszoZF6lWe7HnwzVy5Iy6/V5ZuTQbWYZ3c2qjl99lu8FXzyrT4XSsp53XCB5hF4ylZt2kJFkvQMFyIlSAZBu8NL4uAJjyE/r8QdhqkbkSG9CMFYLFsbIe7exxkCFlzNVF/+xWm2CDbqCghGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764335515; c=relaxed/simple;
	bh=wPfBuuRbOQzpvr+HQJeCzp5MBHbQLw3bJS89RfFBpEY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IT+sKQPKxi64KCfWRXUOZEi2DHWFfcF9Hvzh8WJuScsXPjzxpEA36mO83Go0CEyinMCe2gkFMGwM97r15CqbzrehwFRgyOw7fbnZmcmBBJAreqVQXUwZ67vE8GK1by/RH13aL5qVHD8pChpOtvDELwi9Jd/tDAwunuuQUVyGD9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-3ec5df386acso1103325fac.1
        for <imx@lists.linux.dev>; Fri, 28 Nov 2025 05:11:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764335513; x=1764940313;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uo9vcRLG0sffdJ2tNernWLmxwmEkT/AvLbfE2YPHtNo=;
        b=HD/svWxoINDNX0jGiqGtyeiNiNfIkmlV/nVGVv68Ek15+XPVGcHe9oyIyF+kF1H6pN
         +yySJJuc1E3l6p9p/IBJKDuwlJS2PeIOd6jXtYaiHI2si4sry9Zqe3o5iyxxQE0A2HEN
         jSN3QADJyujqG9iUUY6L+3zf3lXhG7OQG9LBxzvydltYXHCjdSseC31pGduA5kk27C7x
         DffcWS2QsOOM7Wsfr91Ij3H4YMhPzTWe2iCvf7CvaNmDO8rxr5SO5uXmO/WGT2XDdcFD
         EAYkbNqm9fIDzKOmIoqVX07Oc9mqQZWiewrsbeKRJNn2hWJ+DWwb272UW1VSbvAKRA7V
         g9oQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtP7VjPBjwwik405NQj3M64dw7xjpSNjk51QqvSvrRRKvfwf90v0+zy+38/LbDfa7Q6Qc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxhC9tDW/KR4YSWRRsk/jh5D3E+eoGwt4+9rdFhy0ukUHbUJnnd
	LUui83E7tEmQyqOwK/LLEVr7g8UGTEc16IeZ1yO2iLofDmqrG1ydtgq/
X-Gm-Gg: ASbGncvYDGu82S20V3n82wekoVbEspjqWFLf4Z4m8+4kMPzc6/vgZK3T8YkkA3v4bpD
	TN32EPzhJbtqu/XCGdGMOELEgTJ1/DHxhcZJBpeOTGrhGUQYQ/ByIBE2oTfqZ4Xaq2vUmScy39s
	F6tuTBXIkc8LkMb2G/lWdBKzr2MAVnZCicmRI8//VQfk5csLeJYPSacVtXakJl+CCAFXv+W6HpG
	FFwOx6Kz0XzwSC6g8LXWSjqeXbCPIBSridfoFB/GT4QpW5+ZGYIzP+vbZ9t81j/iV7VLQzhmIGd
	TQYisEordYKCV1+qPmJHpIoYBO6eipYsS/Tw6KbdLyKfzywMxf+UtTiaoM2fkyi6OOXrYqul7OY
	2Y1sluB5ay2KUkNToDc4sVfzU979dbHl3y3N4YIOJhBQz+2JwEEdSQvGxAIp3no88tUD2fcb/Ne
	VAb93ihWBY7uT+nA==
X-Google-Smtp-Source: AGHT+IHMtWs+H6VoFeAZ4KF7o8BPplF77Zskrbnrap/+zhewizkk9Ay0s01zNG3UCeFYf843DlHFeA==
X-Received: by 2002:a05:6808:398d:b0:43f:b94a:14f2 with SMTP id 5614622812f47-4514e635561mr6797100b6e.16.1764335512874;
        Fri, 28 Nov 2025 05:11:52 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:4e::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45317113578sm1207649b6e.22.2025.11.28.05.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 05:11:52 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
Subject: [PATCH net-next 0/3] net: freescale: migrate to
 .get_rx_ring_count() ethtool callback
Date: Fri, 28 Nov 2025 05:11:44 -0800
Message-Id: <20251128-gxring_freescale-v1-0-22a978abf29e@debian.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJCfKWkC/x3MUQqDMBAFwKss79uACSiaq5RSgj7TBdmWREpAv
 LvQOcCcqCzKiignCn9a9WOI4jvB8k6W6XRFFIQ+DN6HyeVW1PJrK2Rd0k43zkNKM6cwrgGd4Fu
 4afuXDxgPZ2wHntd1Azx/DWJsAAAA
X-Change-ID: 20251128-gxring_freescale-695aa9e826d2
To: Claudiu Manoil <claudiu.manoil@nxp.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Ioana Ciornei <ioana.ciornei@nxp.com>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, Wei Fang <wei.fang@nxp.com>, 
 Clark Wang <xiaoning.wang@nxp.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-a6db3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1209; i=leitao@debian.org;
 h=from:subject:message-id; bh=wPfBuuRbOQzpvr+HQJeCzp5MBHbQLw3bJS89RfFBpEY=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpKZ+X39YtaH8lgeg4bEAgtcx04w9xGnjGKvxUh
 l/za36DZqeJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaSmflwAKCRA1o5Of/Hh3
 babRD/9fycIXztKGa0k9ztryGFwc1vsXl3dSU+02G0tUOaMMbW1mke+MOc4/vmxiT/UqdWJ7JxG
 diXh4y8s3JT7C9F2TMRlYYZp7wNr8mhXoOdOcNCt2fc/Hk6wXySiuPx+tbuCDCq6Q5qZi9EHJoi
 cMfW2ustDCQVVC5eOva1waqqBT34UoxmFI/oYtGiDHGCw0ZreWknfZbSHSdBNxQU0OvfWxIS19E
 CVF/AarITWCLgEaEE/j/ppVqu1n6wxGojoh1C86wcbSbfyau6t4oSG5CpQGUTqKpho64uDxZIJd
 MrGCepCpMbgbGRwTdQBzl/W7Y6MChPB/T7dUMzFC6cj26YS/0o20FApIt8UDURzJ6aoZTMyirPC
 0nr+5krzvk6G02L2nwHB2Gp7tktbdNGD9ZxTicxAdfv8OvRWvg7v0SzCQyzjnaK8e5LV3IfiDLW
 E/Xy2mSKiihTu3RjlGBvHRekMrFqtE5BInUjDYNp22Y2KMN8h6kJxGWO8EvGwPCxF5dq6RGye4Y
 xPIVnb0xmSjC6oO14o7XMgVGhPxaR737aAqBdEJZEReNxFj6rMktLGa1+dErtZjkqNbzvQrFSJ2
 ce9/9lqDSkPDY01KDZf5/oYwO8Opu2DcgwlXrBJBtwIRZAMeo05pQA8guWg1LV0o76Urynixr0l
 0VX3ZhiB3jEweSw==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D

This series migrates Freescale network drivers to use the new .get_rx_ring_count()
ethtool callback introduced in commit 84eaf4359c36 ("net: ethtool: add
get_rx_ring_count callback to optimize RX ring queries").

The new callback simplifies the .get_rxnfc() implementation by removing
ETHTOOL_GRXRINGS handling and moving it to a dedicated callback. This provides
a cleaner separation of concerns and aligns these drivers with the modern
ethtool API.

The series updates the following Freescale drivers:
  - enetc
  - dppa2
  - gianfar

PS: These were compile-tested only.
---
Breno Leitao (3):
      net: gianfar: convert to use .get_rx_ring_count
      net: dpaa2: convert to use .get_rx_ring_count
      net: enetc: convert to use .get_rx_ring_count

 .../net/ethernet/freescale/dpaa2/dpaa2-ethtool.c   | 11 +++++--
 .../net/ethernet/freescale/enetc/enetc_ethtool.c   | 37 +++++++---------------
 drivers/net/ethernet/freescale/gianfar_ethtool.c   | 11 +++++--
 3 files changed, 27 insertions(+), 32 deletions(-)
---
base-commit: ed01d2069e8b40eb283050b7119c25a67542a585
change-id: 20251128-gxring_freescale-695aa9e826d2

Best regards,
--  
Breno Leitao <leitao@debian.org>

