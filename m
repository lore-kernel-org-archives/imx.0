Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919490;
	b=g5kIt1ISqSgTjmkgHG4I8/5DcBh8TpUnPMmznYCgzG8e+jBXqX/rTkS7kWJ8b3dpIF6Z
	 YcQEgAoD/A6AsZ79nEne/kolWp0a5R7DqiEoZZAXE2O54/4MuzhxMOEwrOQf6l+tSe3Xi
	 fh/dglT5hS/FJ3tGSSTCA96wUl1nJYAcyei9KKvIJTW5zatZmJ0sIdOYl3Q0rWbdUa1fu
	 UKbQDTRKWDIWl/ArOBMBqc9YpX6oLP49ukolnYJpLPZxXIB5MZkK8Ex8GrPh09MjHw2+l
	 0jT+WGr83NEMvu3wzMq4tV1G9XNOWcpGW+gVZHJ/3G6PzUuZOHRa/X+dY3jeuXtsT7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=65x/rmOi9eSRyE50YMLG+5ikwTFST6PY1hiF0uL56W0=;
	b=hfLepDXdkgkVG+DRYUWXG+vDvEmdUStFWqfj5o+A7APlvY5zn5NxiZcj3gebK9HOuj/G
	 D6jTXVYdXkolTFY4MA7WEsUSlTGQJ33hbA1nfAfGlzNZ0aSDJK61GHEjIrIz8YUU2w9kD
	 y0kNh/RNGaT8eALAmkAakwDRw7jL4Vqnwg/1iUrlZNPY+PmuFFaOZJ3xAMyi5JIjgRZsJ
	 +tzCA3+HJB1m9+4FVc4s8JxbtzI5kHbMDba18kltJLmRUx9MUumcEjVaCGxDz8iQjNjT9
	 iz+YR4f++lP2VgWoiSjRF8oucOu+6e1VoOznsGK1ImYNE2HP9fMYG1GhSaOQP+X4AfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XJOMOQrZ;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C406C606A333
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 12:44:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C406C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XJOMOQrZ
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ed08b07213so21683935ad.2
        for <imx@lists.linux.dev>; Tue, 17 Nov 2026 04:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919489; x=1795524289; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=65x/rmOi9eSRyE50YMLG+5ikwTFST6PY1hiF0uL56W0=;
        b=XJOMOQrZRUcCBcC+Ur6t1IbGo+yslPuwVxaEAefEiSVC22t3ZwX6qTu3XYPkENaSSV
         SMEslCADouirf80exCibStzb2Wq1byQVmkMjMgoGYwkiVR11adTt8+JtA7gGeiCpAW72
         l36uL50wChVWV/LcIELeurb/F8V/xXgdEUFBuDnnUCfVDPtFneacgmjOTc4x7LAmRTyy
         yvG/vElBz8WNUCKIEeOZ3L3p4AkXki7644xibx6bjCogGlq8sxykotVjrgm75WonV569
         CSBBzo1yuJYx87vjzH0Avyn/7hVbAd+YAThnLNtKMgk0ZpF3woomUR1lNfQ5RILPLWFV
         +WYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919489; x=1795524289;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=65x/rmOi9eSRyE50YMLG+5ikwTFST6PY1hiF0uL56W0=;
        b=UBBPtoImHkSjMWeS3HReeilNShkjmKeZYL+kGVzZhlWUTYUx4btdCnvAbFwKgpSTtn
         z1sFcK9JEcQgJn10ELnnVhrcmwbYyyCJ+lbm53SPPS4ssHuY7Yu9O05reYoTqQpJXVlx
         fYaXTtPMMggbQtnykQw3l6L7+9k1TdK1x4aovC/sDD9tfwWG+7PZ+I5NOLl/1vimUX2l
         0ynkQ0EHesUjYXfzRERNFy0IDx6efi1Pz3cw2sT9/RugjooPJDBFgxsKAHXyxduw4+Ci
         rfPs1m96UzMBR8BEv+cCfRTxpLTpTGodTZ1lZVWNoRZLXj/vWahnmCUuBIcUeXemLfob
         xeyw==
X-Gm-Message-State: APuU4Z8ggkFMZgcZGHWl3VHHirKO7cxOvT62BPwKSIxTsiyPlWO8Rnkf
	GiU+MS/NiQllGC5XZbryxKL2Zhwx9d5/3RaEZZ9VMNwwxVHLi/viL9Us
X-Gm-Gg: AZFdTZe0R1Q84f6pjW2Qe+sWbrFG9X/RdC/uJvCxPOtci1o+KUXCdvBmOwMwFO2/c+V
	loSnmBuN/o6H9xooRAWPVWtjftAL+1pemFwt+dsQNkkqscGYdAAX9/JJLI0PIhTzer2a70hUgrh
	4LmlZ+7MrDwlEtgLByXdvDFuegcqLAjidf+kdiOncWzWWIUSmGaDUYAQ4Tqznzu//Twmlo3cVC1
	YgGIbcy49KQjo9DvqsbxaISLKV1F7EUyfMx/QF4uu9ZBcvIk/t/iZj7YzJRu7SlBr+HINC2HJEj
	ws4uc+H9Cv6/8u2DRBVBDjN8VzEkbdcbbld3fIyodvszP+HMy8Hq4as52G53sM5uJX1J6rKa6hr
	nKs5E3FMxVi4ETypahUDexzsmhIJuZGZWHuC+lLHgDZMPOkiEOawitouetYCnjokNtRpRaCkjfz
	VInpCRaQZ1YansUhuR1yKMk1GRRTEj3vwEQXk6pwvNKFIqkjWi0dbZPiuHX320rP1AfNTAtJhtB
	qYA6z7+AkCHDWvi8nJEl2PBHtw/0gvfCMgiSKbVl3PJ3EP3T6lSImvFhtldUo6wiLREijJFRxPe
	nqEtjUUnJ9DaT8U8zvYUrKWYOtN62cFHWw==
X-Received: by 2002:a17:903:19c8:b0:2df:9655:fe24 with SMTP id d9443c01a7336-2ee0dcd06d5mr119181965ad.30.1794919488900;
        Tue, 17 Nov 2026 04:44:48 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a85f1dsm14585725ad.59.2026.11.17.04.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:44:47 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Subject: [PATCH v2 0/2] Add Toradex DSI to LVDS adapter with the 10.1" V2
 display
Date: Tue, 17 Nov 2026 09:44:12 -0300
Message-Id: <20261117-v2-imx8mm-verdin-add-lvds-v2-v2-0-ecfd237cf7ee@toradex.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABxM/GoC/x3MQQqEMAxA0atI1gbaLmLxKuKiTqIGbGdooQji3
 ae6fHz4FxTJKgXG7oIsVYt+U4PrO/jsIW2Cys3gjCNrLWF1qPH0MWKVzJowMONRuTwlkCe/UBA
 zGGiLX5ZVz3c/zff9B0l3gv5uAAAA
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794919484; l=1590;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=Fj2m0UsmYRbogE2wB5gnwQa+eW5qWmp45T7j+6XBwIM=;
 b=l2PR4FEDB+ESaSkJf52gV0k6GKWc9FUD8b8QzlURaMMAOj6dohZg5elkpgnWtzvKi+8fj40LO
 n7rxq6nv+elD/Y1f1gYBh68+aCmZ0Hq64vyvicESYUrrZ+YW5RC4fxy
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

This patch series adds the device tree overlay for the Toradex
Capacitive Touch Display 10.1" LVDS V2 through the DSI to LVDS bridge on
the Verdin iMX8M Mini.

It also renames the existing DSI to LVDS adapter with the 10.1" V1 display
overlay, to keep a consistent naming scheme with the V2 and with the other
Toradex Displays being introduced.

Changes from v1:
- Rename the V1 display overlay to include the 'tdx-' prefix and the
  '-v1' suffix, to make it clear that this is a Toradex product, and to
  make the major version explicit.
- Use the new naming convention for the LVDS V2 display overlay.
- Add comment explaining the usage of rising edge for TOUCH_INT# in the
  DSI to LVDS bridge with the 10.1" LVDS V2 display overlay.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
Leonardo Costa (2):
      arm64: dts: freescale: imx8mm-verdin: Rename Toradex display overlays
      arm64: dts: freescale: imx8mm-verdin: Add Toradex DSI to LVDS adapter with the 10.1" V2 display

 arch/arm64/boot/dts/freescale/Makefile             |  34 +++---
 ...dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso} |   0
 ...-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtso | 134 +++++++++++++++++++++
 ...8mm-verdin-tdx-panel-cap-touch-10inch-dsi.dtso} |   0
 ...x8mm-verdin-tdx-panel-cap-touch-7inch-dsi.dtso} |   0
 5 files changed, 153 insertions(+), 15 deletions(-)
---
base-commit: 33adc96ac217d6e95b7c44ac383c19ca4ae2ff52
change-id: 20261116-v2-imx8mm-verdin-add-lvds-v2-a6868b6ae070

Best regards,
-- 
Leonardo Costa <leonardo.costa@toradex.com>

