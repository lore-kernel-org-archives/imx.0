Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229CE1B1504
	for <imx@lists.linux.dev>; Wed, 14 Aug 2024 10:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723631781; cv=none; b=Ne6qn/lWtsUPkXAAMqlNFre1i6lmVtz9wwRlAzp86l4tZQ1FWWHuRQH3qFGhJZp27Ixpr+ccMLQ6pLnIco7nNtgpEnNqiyh2OsXCrR49MejC1kLWZGmHhxVrzospUK92Kt1ahqob/0YiR2O7AUdv1z0KvRKscrdOki50jGyffGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723631781; c=relaxed/simple;
	bh=ol6ZTXC6dPx1NNnToQYOXH4GwET4WoJKZEvGBAAyChA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NzEoVbmKIv6hmqH9TjHi9MIPC/i3hScYu2GN3ZcRp+xKkCdFT70HzP5JZ0REsxjqVCoSmIdBy2XUsTZF6rj4Anq/zleq7GZmZzfUKYDZO3xJfMRi+x4XHAtnEonFDwEXjLuINW9r6TbPxjegadc6Cj2wxTQzSTgYfLP6Lgf3qy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kzwzW+gu; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kzwzW+gu"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4280b3a7efaso47832355e9.0
        for <imx@lists.linux.dev>; Wed, 14 Aug 2024 03:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723631777; x=1724236577; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SCsVD5Gw0XMLJtG9b25d0pMLRHt/Ggpq8ks2EPhWn3E=;
        b=kzwzW+gu5By7hZutfthovk5oYbfB9C58ELH86LokzWXRpSH1HOyAJ35TAkCle5ym/1
         ozBpX9vuRjqEY+GtX7OwYigzm35ysNKRsY153Jxc42CWRP+5CsKt5aWqV1tKDC4g/U83
         5o0/gRtBpG0G+9eSh+zon57qtZsNTihImqjGA6X8H4xZnHizEU+XjOuB3peTkDk0L5Au
         T11vLRpdjRJcXEp47X9+45/Qsfke11bzGnlv5uPLpxnsT+908QQTJxi/qGmHiqlOG9G8
         8ozr1a2n5tFwvW8JIGBMa0SzmHu95bJunLPkBRtjHk7giGXwzImNPSPxHcl8BbvA/s6n
         8XcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723631777; x=1724236577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SCsVD5Gw0XMLJtG9b25d0pMLRHt/Ggpq8ks2EPhWn3E=;
        b=GmyBMiafb0lSB1MC+zNQICiryUuIDGzgeYat+6cA0oljGqv6n7DjE3ZuJHn3RxHhXn
         17pnzPVIF6ruZZRBw65jwNXbZtv0TreLoktHbCEZkJfdqCyIUmLlF6NAXaWWC9ZLxfRf
         nSw43TPT4ffpBVAUjHLUpK7inz4YbfOdPGB4pSUk/pmoSFBUTz1EriH11nmrCmNHIIUV
         TBMOtCAeoc91hxg3SpGSEKW5BZnLN8vRQ4UsRE9uum8NViiL0N6Cl5FB5QfD4n+Vv57S
         MSt2YYPTC9KFhV6Mdw62I7zmMahPrAMpG4idjuLoecn81L+PRjoyhI7NInR4ga6qamSa
         0ekA==
X-Forwarded-Encrypted: i=1; AJvYcCVQAy/BQFnNKu1YLknBc6nRfiKb+0lzQxFqbmz+gCJfc4C2Cw1EPkKlEUDwAs+aW2WxxPw=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywp2N+DftqlPVUZR1kIDx0N/YGEDKRZ//Vz4a65X1hxhjXtRjmw
	q17+oN4NRYhMwn8esgRwmcCYkuAgRIlFOlzWjqbz4nx2pKFKA5SZ/qN2iyjJ35k=
X-Google-Smtp-Source: AGHT+IGcxmywyTO2gvy35KOCttJ+ZJhhBQ2L4GtnK9UfIj5G8nLkgiKFU1tAu9Ts0iBIJ00/ObFPsA==
X-Received: by 2002:a05:600c:1c93:b0:428:f1b4:3473 with SMTP id 5b1f17b1804b1-429dd25f517mr15394135e9.26.1723631777491;
        Wed, 14 Aug 2024 03:36:17 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded3dd4dsm15501835e9.29.2024.08.14.03.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 03:36:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 14 Aug 2024 12:35:47 +0200
Subject: [PATCH 11/11] usb: dwc3: xilinx: simplify with dev_err_probe
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-b4-cleanup-h-of-node-put-usb-v1-11-95481b9682bc@linaro.org>
References: <20240814-b4-cleanup-h-of-node-put-usb-v1-0-95481b9682bc@linaro.org>
In-Reply-To: <20240814-b4-cleanup-h-of-node-put-usb-v1-0-95481b9682bc@linaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Michal Simek <michal.simek@amd.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=890;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ol6ZTXC6dPx1NNnToQYOXH4GwET4WoJKZEvGBAAyChA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvIiI0pC7cGWUcMPtTN5Rj4I9ue4DwVHlIBTOR
 FZKTmMNbuyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZryIiAAKCRDBN2bmhouD
 1/31D/4lelP2Ou1IyK4wZSB1Osrpv5THjLFKzvWenV3V5pHokmwuau5AJypaMbC2qkYkpr/mo1g
 WN0nuAtUFwUL57BPiqPpDYXrg9FDydmfDejUCaamjp+u6b6rJNrdNrP77XKpl27yBUP6koL22tH
 a6tGDDWdza5ocxOQu1Dkd44EM7uKDO6m9V7sUfhg1u8fZCL6wVLh/ZkYVSlSWB0/JEG4xOpDPvS
 mz5OYP4ExBLwy1UHPMjxsoWG6fo66yASdJ7oQJeBwrhLwxDiId88883oH7rgXiF7hlQJ/LDe5zp
 CrtGSn+DMV2F+41SmyuXRZgscfeVqGyxFMHVmSd5QqVFxNQVKkzBS6RKCPZNmQjSK7g2Mr65lFL
 jZMlm95cOlybp4FnequD5MWQr0616bw2DTxDKOTnJ9jVRQhM49dfkKoivW1YSxhXVzXXnjiIXGN
 v9Rz+OTnO/57SoVX5fOhI7z+C5FyYSyJA0mjZ5RqPVV3bjp5m/7SjWSzwckXidcwpGWswyahE1q
 tfLywc0KMgHHQLePAVq6LyQ98L48G+hcIo5X3KY0HeAeOnOTm8F4imWVj5ffkZ6FJzKu0V2Gi+l
 wwwYkgm/+wqTvNYRpLWfoUetlqZqSO8w0wLbAEUV5j/BFk6XqTnLhXiw6E0VI9viRD6fSFhT2Qr
 KEl4SJzQy/0HuFQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use dev_err_probe() to make the error paths a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/usb/dwc3/dwc3-xilinx.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index b7613a106da6..eb535733ce91 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -285,11 +285,8 @@ static int dwc3_xlnx_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(regs)) {
-		ret = PTR_ERR(regs);
-		dev_err_probe(dev, ret, "failed to map registers\n");
-		return ret;
-	}
+	if (IS_ERR(regs))
+		return dev_err_probe(dev, PTR_ERR(regs), "failed to map registers\n");
 
 	match = of_match_node(dwc3_xlnx_of_match, pdev->dev.of_node);
 

-- 
2.43.0

