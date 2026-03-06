Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA1C3AE709
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 14:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772806987; cv=none; b=c9bK/cQI7uXPWO/x19cJFL84bPyAvJa/qLotOjRiD86xyXwbxqLpiQ94LURKmotKtWrL7kFJAS6e887uHV0Gz+ca275DZEWnue0zFwXkJza4H5z/qWP0z1yJNQZiIhdMAmIWbKt28Z6/ubi5EskK0cPt6izop5R92ngnhpKsfCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772806987; c=relaxed/simple;
	bh=GmCXbPoc8/TfHGNMgmsNF/jXheLGU1o7tY0xuml1IPg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eoEsFW4Jf8UGw/8dr8FO2rYmDIzijmlF81a2wKdetglWs1HP2TuydD7KzLCmMefr90zfg6p1CSgZhiQNy4DvEkLKLvpxFvLBdmq8hTLRAJupep0r5BRG3f7XDm6tezLWlZ2vwXNS7I1xRPJuq1df4HTf3CbyjEMWJ8T2EDXsah8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T8zxGE2m; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T8zxGE2m"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5ffe9a5b128so211241137.2
        for <imx@lists.linux.dev>; Fri, 06 Mar 2026 06:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772806983; x=1773411783; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dueXMGXpxv0xbCVmzWXvE/Ffw9BJfJL0ZtVGlTEf6/0=;
        b=T8zxGE2mtttCIMw7favzAdxCv6gHY27H54vLJ3k8uMOcN5dfNGPeSA0ovZKs6Ec0dN
         9TvwrEj/IlA4vgzLxRw9BFF96LbLDKCPwBKxP73RFy0QeW4z7rtgfd2HYzH9bC0Dm/m7
         sgdjNoJs+EvC+HGy2IIqfpinwEDLoL5GXrYut+JGeGrxfg0u2qvpIvoog5tptJIZ4n3X
         DGiNogYkKHUPCdy7pRD6/wwyhw1tHkgWCRDxddJFk3YWhHUCy0Zkz0RbsN8yE1iM5CzK
         1t9TIWEIgVUO1RpAAqv30p+Bwo+hwfLYbneJS0wX1zMSOEwuFDO81OXJS79lhMExCfxA
         6IVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772806983; x=1773411783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dueXMGXpxv0xbCVmzWXvE/Ffw9BJfJL0ZtVGlTEf6/0=;
        b=gH8TzEa4GLiwrjsvC2Im3EIbeVEd4ugjPrWyiUjAa+j6E+sEtSp62ug1kcObZWbKqk
         0+HK5ueGzxk4Ks0U/G4513T2VB2jHUgungGIWb5nUjvEUKiPLY3k5wv92IacrK4uwCdm
         A3PEH3wSdhvmHQzXZVh4BHdxVLjaL4L8Y3TlvcWR1QPFnUHUKfYePAapuTNMI6Bfs7Ed
         YuwfGQes3TbPdhNKVD7OgF5X0BYDjqJ/5OUIcZEmmzibBeciidxaVny3vzMDcVALOiYf
         IKd/Shwci8Yz/IynxseJX03IHHnWAXnxpCeVaKtUmeAlMgsYuRMT8BG36osU+B6anc9c
         ToIg==
X-Gm-Message-State: AOJu0YyyZkzIepfedLWRZyR03Q3Qzx71tR3Ber1igzxBHiSLCxizQo3E
	c+P6g9EtiMIehqaKIW8+1+HmOt1cNFnJqy0LdFQjP8+OTbQry/WK/fv0
X-Gm-Gg: ATEYQzx5QKpuTqigYl3pLo1Q9RnNUTSCXqGqRZGNQ3iFU11XAPSa0Azgrthfd6X4Fuk
	ONOEcthf3+ItcpCCcQ6qvEoSylztrKvlBJeaA4PXnaC6c/kIYx2Fsea0TV9o/QKEUhFYptlAnxg
	kmkkIkFIHmrCa+eYnifYn72r0Aj8bp2eEr9a7M48MHTD7C8JbVkwSlqWXhN7XU9CDQ1qKBQgYqL
	aaOZUZkXDQUzFw7NmToMZGh3x/nP5aIHvihqHUFnkHey+whmLsGJ7k58CmiwgWqC6y89UjGS29M
	KXYdbDaj1/6t0WNFWIxhesmDZUL+BQgOqJnIwIHUkDGieeNXTIoAB21QTlj+uB/jkAbcFzCMNCx
	eYQO4IfdMytHtqccZksgyi2XvWb+4rFy05pV7kGTDL0ryKud2VXk5UEGGh75wYFYZxayEIIRX38
	exccGAOuJ14c9I0R+5zuGabPyFKxIE3fJ6z/Kdmn5krkG3kUD7nfM97NtMGNY39uI5xj1oXwiA3
	thp/es=
X-Received: by 2002:a05:6102:1613:b0:5ff:22f5:e37e with SMTP id ada2fe7eead31-5ffe5f5af8bmr731824137.10.1772806983101;
        Fri, 06 Mar 2026 06:23:03 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:1b3:a802:8875:ddd6:ede8:90d6:abeb])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94e7b36d64bsm1540781241.6.2026.03.06.06.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:23:02 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: srini@kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Christian Eggers <ceggers@arri.de>,
	stable@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] nvmem: imx: assign nvmem_cell_info::raw_len
Date: Fri,  6 Mar 2026 11:22:35 -0300
Message-Id: <20260306142235.1401319-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Christian Eggers <ceggers@arri.de>

Avoid getting error messages at startup like the following on i.MX6ULL:

nvmem imx-ocotp0: cell mac-addr raw len 6 unaligned to nvmem word size 4
nvmem imx-ocotp0: cell mac-addr raw len 6 unaligned to nvmem word size 4

This shouldn't cause any functional change as this alignment would
otherwise be done in nvmem_cell_info_to_nvmem_cell_entry_nodup().

Cc: stable@vger.kernel.org
Fixes: 4327479e559c ("nvmem: core: verify cell's raw_len")
Signed-off-by: Christian Eggers <ceggers@arri.de>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/nvmem/imx-ocotp-ele.c | 1 +
 drivers/nvmem/imx-ocotp.c     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
index 7807ec0e2d18..4585da51f7f4 100644
--- a/drivers/nvmem/imx-ocotp-ele.c
+++ b/drivers/nvmem/imx-ocotp-ele.c
@@ -131,6 +131,7 @@ static int imx_ocotp_cell_pp(void *context, const char *id, int index,
 static void imx_ocotp_fixup_dt_cell_info(struct nvmem_device *nvmem,
 					 struct nvmem_cell_info *cell)
 {
+	cell->raw_len = round_up(cell->bytes, 4);
 	cell->read_post_process = imx_ocotp_cell_pp;
 }
 
diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
index 7bf7656d4f96..108d78d7f6cb 100644
--- a/drivers/nvmem/imx-ocotp.c
+++ b/drivers/nvmem/imx-ocotp.c
@@ -589,6 +589,7 @@ MODULE_DEVICE_TABLE(of, imx_ocotp_dt_ids);
 static void imx_ocotp_fixup_dt_cell_info(struct nvmem_device *nvmem,
 					 struct nvmem_cell_info *cell)
 {
+	cell->raw_len = round_up(cell->bytes, 4);
 	cell->read_post_process = imx_ocotp_cell_pp;
 }
 
-- 
2.34.1

