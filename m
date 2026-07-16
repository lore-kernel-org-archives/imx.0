Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9618042D779
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 14:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784213030; cv=none; b=bqO1+GnAPxrk/P+6+I2J+NB2n70vGJ6v/RMlhyeuyyXiYLFXfaye7mMIgb+nPhRu6IXS/kwlRi/d8RhkoKL8tUygN8Wq7yVZpf7B5zrEidoTrPpEbSSDQ2xxQ2nbpvO5lKAeU/ZTbJ7pg3oexwhJpd88cldQtV3H+qWHQz4fQec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784213030; c=relaxed/simple;
	bh=CahpD7cyrRer+BuhTpATMBmSpR1qu9d6vPKJwLr9lTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=em8MdBubJgSQSWYYBTzObm3+pm9EAmnuyt48FE8IYzEmla58LJ4bnlrMZgKt9d5L/ysOlJr1M7IQRg/EAndEl6fm7kDWaRGnxMFig4S7BwdFx6gjrb+VEjhOaGwt9Mcz3DVhpSO91EGSSURT+w5hAp4xgJ3z5iuk8ULprHSrzek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RThZ2GGj; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RThZ2GGj"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-66825847b2cso916766d50.3
        for <imx@lists.linux.dev>; Thu, 16 Jul 2026 07:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784213019; x=1784817819; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vp6Bjp2wzhtrtLJqG7J8nPwf3VRW15hJCwHjUU/I7Wg=;
        b=RThZ2GGjw7fpOw2mXMLoIY1gcZA2tAo6uX88hzQvyOOsP8c4BsbougE5Z5jrV4UBr6
         I3gZRuKCm4zYJTq8qP6A81k7x+MU2ElBZqgqAi33jQjXycYKnhZWXghdRb8dPw2XGDU/
         IGbCHJFDzbXRqR+rSlIXGnD7W+PUmXJOVcz9QTvCE2GoAR02ycCmKRYuX2GQ/781+UY1
         2Unpp0NFj6XGMrpHPNeFDnDTG/qCN71yBckSJruEA5Z/e3nZmRpol/f3BTHeKrTc4+ER
         ic90M2ePF1/Awt3k5tamTQDKUnVyqMgZ/akm/xX7m9F06eISqr5vwRS+8h10TdKBae1e
         rCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784213019; x=1784817819;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vp6Bjp2wzhtrtLJqG7J8nPwf3VRW15hJCwHjUU/I7Wg=;
        b=ciQyNURCQh5fovsuaDEUppFAl5iLPaygsVDHANsgSzhX9DOGKKDl+Wcc10jetoCI0E
         8wYqXa+DY9EB5qB+zbZJTmHwpIxsZE1UcilT/JQnKqOF0HQT7MBloDTrIsDV83N3ZkqT
         bgILdPMbAVR1SuJhj6RlUj5csk7gMso/XbNS11MpW5gnsUFyIXSGLNLjnxEgFl6hFWJ3
         bXhnBLLsjeKlPzJG1BK9Teo6IrqixB9mQrTNJKS27/+NwgRJWsoQV89c1nbPvhUWC21q
         SEMRXdFNW5SXagrB2aeBJ/0ahKCMORFHf/ETTwyKJ3J6DfQUDoBF2bInsTb+8i3g1RWm
         XYSQ==
X-Forwarded-Encrypted: i=1; AHgh+RqbB3MSW4p9o397pxKJA9kRonOqCHJCPyLwaOgO1DyJPY6SRH01F/vRGU6IN4aVSbgrLxQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzkzBbn376yD1/OhU4WeHf5Tae5eBynHd9dDTC54rv5uXhUer8M
	UFCXqyG0oVKfLbmJdFF91HivDcipQElzjPrPy66LIFnLpVtv8C9DbnHx
X-Gm-Gg: AfdE7cmQCxBqQhkaQlXXalxaYbIdbWiEVkYhieS+1TLVWXyuOWPg1/YiI+oz/ie100V
	Bupy4H0OZelhtjpYoikTXNpEKpouBqeYfFV2LvfbSeuUo8vTcqCaovzQNs6st1wV2p2GJYkAJsk
	1y8rigQUedpqx85nx5LbJtWIHWXhvBNgMuEu9crMd1CUPxicEKMyk44ZrFnlzd6fOIVrPWdIn+F
	/KHQe8lDeY5GOcnqOt1Z6vyfN9YFIbXbVdeeXRBYVLd4q4RVErwQKhS8ht2+0psk1gCdsXaK6HB
	F1HF3e+x1QFJv4dnNUz8jVbNuO3za7T8WaCJctI9uqKpRPZbisFckVr2/at9ryaARwfGu58XgHF
	vtLhhyj5ihmTIndrit8gE5aHRYxvEFRFHeJU016Qc09N+gy96c4L3nuUcmUs+OjT9Svh3CIKnpD
	pCdT8h1GM2+CnynMWA82WDVC1dp4hY8qEnyUdgEZorfnQSkHksdyO2glq8he8lVcSimFUvkw==
X-Received: by 2002:a05:690e:16e5:b0:667:9f79:35cb with SMTP id 956f58d0204a3-66813436773mr4282441d50.53.1784213018782;
        Thu, 16 Jul 2026 07:43:38 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6681fe46cd8sm3509707d50.15.2026.07.16.07.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 07:43:38 -0700 (PDT)
Date: Thu, 16 Jul 2026 11:43:31 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: hongxing.zhu@oss.nxp.com
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, bhelgaas@google.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Richard Zhu <hongxing.zhu@nxp.com>, leonardo.costa@toradex.com
Subject: Re: [PATCH v2] PCI: imx6: Fix i.MX6Q/DL boot hang by separating PHY
 power and reference clock control
Message-ID: <blkjlbskmfiyprh6wlbfilwlgjw3zkbslh6fpogcc5vcfu5dvn@hcrojgleuxob>
References: <20260708035928.580236-1-hongxing.zhu@oss.nxp.com>
 <20260708035928.580236-2-hongxing.zhu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708035928.580236-2-hongxing.zhu@oss.nxp.com>

On Wed, Jul 08, 2026 at 11:59:27AM +0800, hongxing.zhu@oss.nxp.com wrote:
> From: Richard Zhu <hongxing.zhu@nxp.com>
> 
> Commit 610fa91d9863 ("PCI: imx6: Assert PERST# before enabling regulators")
> introduced a boot hang on i.MX6Q/DL variants by changing the initialization
> sequence.
> 
> The issue stems from coupling PHY power (TEST_PD) and reference clock
> (REF_CLK_EN) control in imx6q_pcie_enable_ref_clk(). When these are
> managed together, the timing between PHY power-up and reference clock
> enablement cannot be properly controlled, leading to initialization
> failures.
> 
> Fix this by separating the two concerns:
> 
> - Move PHY power control (TEST_PD) to imx6q_pcie_core_reset() where it
>   logically belongs with reset operations. This ensures PHY power state
>   is managed as part of the core reset sequence.
> 
> - Update imx6qp_pcie_core_reset() to call imx6q_pcie_core_reset() for
>   shared PHY power management, avoiding code duplication.
> 
> - Make imx6q_pcie_enable_ref_clk() responsible only for reference clock
>   (REF_CLK_EN) control, simplifying its purpose.
> 
> - Remove the 10us delay workaround from imx6q_pcie_enable_ref_clk() as
>   proper sequencing is now handled by the core_reset functions.
> 
> This refactoring ensures PHY power is controlled during reset
> operations, fixing the boot hang while improving code maintainability.
> 
> Fixes: 610fa91d9863 ("PCI: imx6: Assert PERST# before enabling regulators")
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---

Tested-by: Leonardo Costa <leonardo.costa@toradex.com>
