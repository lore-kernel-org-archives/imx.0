Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104143;
	b=0SEU1p509wMc5ZUdovBT5NW01MgV3FinZVaM6Yukym39WB6opm8hMIAkWCzvOkpfHcc+
	 UvvAh1nT6cqQMfWNt94z3pUgq4FtbbAr1b1L8CUgZs6AWRQNKfHDin2A9WNKkbHPvAEX1
	 qOt2twABiaPhkBQAJZtJXLDPhoH8sFTZ3BUIDyOtdyUXUcHFpA1eV+MGawwoh4l3/Z8Wp
	 Ww9Dd+i0f/FF/hD0DmO5hWsbJ/IHJzBk9S+sNwoFoviaxBy00gZM7+X3+AViHMgN9Uu13
	 UqUGLAPRwbXyNNVX1F2TsioVGxlSUif7F2b5CgvNNDsO1lILnh4q3bhLu4mSk25kWOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104143;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=saWYwAO+ESgTqoqpuWDp5pJj1fm4a4bUC7bN/MBxH8s=;
	b=pDj/zMjTa+B7lvo9PesXJVa7aIwtS1f5D18MRZR7D0fDD02pzNATvP8uvnYyuDMwt5/o
	 MCgqmaIV87eAibpSnGnIJRmjzZmDZaPic2N90pm98xO61H8P1Z7NEn41OuGDbuenZTIjW
	 AwHLwb6xrGZ9ZojErZlWD1XdpDKva6ymelxMh6gdt1F6svaWRw1Dbe/ODdFZ8/eRGxVwj
	 J7DFbln5MPeDbemGd1kEu7HWoMEelS0t5mJXsnCmFYs/oqPgUDGDEF31YUWRpq4KtDjgX
	 jyBkIcrB/ufyIxs3qktCWCWqjvd4NofgenUU7tuhgAazdbe1JVBq4H8v/noVREGnuAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=XXxyUugR;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B643F606A337;
	Tue, 27 Oct 2026 12:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B643F606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=XXxyUugR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=sa
	WYwAO+ESgTqoqpuWDp5pJj1fm4a4bUC7bN/MBxH8s=; b=XXxyUugRyVSO/VWHRU
	5foORZsJn70jb/MqKM1iUx1MIVHh1fjY7dqXqTvBihmd0iN0VBccCtph2+HbAO8M
	IhBlLQyW7Pl5hNKEfEx930OOzH9v9fQw+uwyvgFYyWSZAh+IWPJqomhspeVGcloa
	sQg/zYUqMwdB+nbqQJaXbfV3g=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3Dz_umOBqUsqlCw--.64541S9;
	Tue, 27 Oct 2026 20:28:38 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	jingoohan1@gmail.com
Cc: imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v4 07/16] PCI: dwc: eswin: Use cached PCIe capability offset
Date: Tue, 27 Oct 2026 20:28:18 +0800
Message-ID: <20261027122827.2725643-8-18255117159@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027122827.2725643-1-18255117159@163.com>
References: <20261027122827.2725643-1-18255117159@163.com>
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
X-CM-TRANSID:_____wD3Dz_umOBqUsqlCw--.64541S9
X-Coremail-Antispam: 1Uf129KBjvdXoWruF45Aw18JF1fAr1xWw1rZwb_yoWDCFX_ua
	4DCr9rArWUGF9Ik3WSvw4fZF9Fya4xZw129a4rAF9xZFn2gr1jvFnFqFWDAFy7uF1kJr97
	Jr1qvFyIkFyUJjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRNHq2PUUUUU==
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7BY22WrgmPYZCQAA3h

eswin_pcie_link_up() is the .link_up callback, so it is called on every
link state poll. Replace the dw_pcie_find_capability() call with
dw_pcie_get_pcie_cap() so that the capability list is walked only once,
and store the offset in a u8 as everywhere else.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/dwc/pcie-eswin.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-eswin.c b/drivers/pci/controller/dwc/pcie-eswin.c
index ce8d64f8a395..3d3275237f3f 100644
--- a/drivers/pci/controller/dwc/pcie-eswin.c
+++ b/drivers/pci/controller/dwc/pcie-eswin.c
@@ -84,7 +84,7 @@ static int eswin_pcie_start_link(struct dw_pcie *pci)
 
 static bool eswin_pcie_link_up(struct dw_pcie *pci)
 {
-	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	u8 offset = dw_pcie_get_pcie_cap(pci);
 	u16 val = dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKSTA);
 
 	return val & PCI_EXP_LNKSTA_DLLLA;
-- 
2.43.0

