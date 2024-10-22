Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5308839F4
	for <imx@lists.linux.dev>; Tue, 22 Oct 2024 16:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729615572; cv=none; b=d4YMuAr+1MIx59LN+jBqSUjNFjaKi4IKB9U1nemrE5wghXqLKeZyQ/S6ZllzpKR7fVotgERicD9hYac5Xj+1LNU7uG2bbhgbxAyUA/zDL2t2K8b96AQ8loWNPegwO5u7ZCzOKb5CU187w4v6v6jItOS26+lKRycwI52ZHjN1hBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729615572; c=relaxed/simple;
	bh=Lj6PNMCNIu8hj4OyaUbUFkAeau2NGIb0esj+zs559b4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rNo3nZSxZvXIoXUrZ7o1MJjF8SqzVfejk6Vs9t2voMO0F41OHmdW7DkjyBxpMVQHZgrYg285R2JY8mXu1ayi4ZcFG8YQ/TSV+3yddSX7OpxWidrY+l1niJo0JPHco1tEaGK8tPaeKSwPjiYRNv9A/95Of/lj+14OdGge/kwJoCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dV7O2EZP; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dV7O2EZP"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-71e52582d0bso4460457b3a.3
        for <imx@lists.linux.dev>; Tue, 22 Oct 2024 09:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729615570; x=1730220370; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pPeTnArfy3kVD9qdVEi17t1QYmpfbQ/+MP9HcRzS7Mw=;
        b=dV7O2EZPj+TWQ7rC5Mh+zljmQRpjwMV72haY8o1eLgbynVivhX+ytjI4IE0dGmc1wG
         XD0ggqTgkVUVPXLKftUiDBDuvJLZqUc/PjHSjvSO72SV4iT+3L/QkIDDiI1Nmmb2dwAN
         TcjRD0kvQ5+Zz7w4TjTBeB52s50YFeQJfn7NkefEjVnKpuaYyt0yCf0gzJ0VT6Ibaomx
         iImyz5nZKX+ngJ5nIt9QyS//NXIGKnFYg77z8KQpq7RtqiWjbxlL1nKvfv5J+TC94gbD
         l0ZGiVfcsJFHljXAchRBeXxFYO2SDJnKbMipROpNnzz9nY4B0HmRz/t0jJgztTZDmE1G
         FXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729615570; x=1730220370;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pPeTnArfy3kVD9qdVEi17t1QYmpfbQ/+MP9HcRzS7Mw=;
        b=VFLTNLVKZ9uyg6Mqypm+jPr4EJ5fnHHUmlvAoEuigCcXHu0VGXU/KSjFaYxD6mF0tu
         TI1e5lqUJOUjj4njAzG1Eqpntcwo8PyWiEjQkre/7Rl2Gkb2VqpW2O2ArDI1/jKBf0Cg
         oQSlb/QUGRU0NbnY5ekNyI53X0dq/OrAaD7d/QdEr6lCHA2ByCoyBR7VN4PAY+j9V46s
         em43p/o2kzfZulEbQJ7vaTJoxBp07pKog1eoLDo0X2+ZdwT+60HCkWcHRIfbKLPkDoIc
         JDPKePq0avoO87BfeFx0905bgHLtVAh64Yc66bQIorrUjf0xirtn4pxPwtxaqDP/qA+F
         H4KQ==
X-Forwarded-Encrypted: i=1; AJvYcCXd4aTMN2vwQs/6OBNt0VOF5ctOxrc7R4XKHo8HecocGudv6314YPhpkFTFXRL3sM7+LI4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxdi4OkDLBzsA6fnkxs1a++JEb8SHkee7rlklylUp5IBfDoGuj0
	cqY5aJUVQQ5FIugDKZOFudhHtnW0IC3ASrhA0cSfMul/TEOJ+tT4KB1G852T5Q==
X-Google-Smtp-Source: AGHT+IHTS9yyMdGSpDBkN1ZywG4L881bK6lpw9juFK/sdg8K6E7YS49sKlIWRIuG+HaxSkMO8HbgaA==
X-Received: by 2002:aa7:88d4:0:b0:71e:b8:1930 with SMTP id d2e1a72fcca58-71ea321e7famr21475298b3a.16.1729615569937;
        Tue, 22 Oct 2024 09:46:09 -0700 (PDT)
Received: from thinkpad ([36.255.17.224])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec13336d1sm4966249b3a.56.2024.10.22.09.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 09:46:09 -0700 (PDT)
Date: Tue, 22 Oct 2024 22:16:03 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: kw@linux.com, bhelgaas@google.com, lpieralisi@kernel.org,
	frank.li@nxp.com, l.stach@pengutronix.de, robh+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, festevam@gmail.com,
	s.hauer@pengutronix.de, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kernel@pengutronix.de,
	imx@lists.linux.dev
Subject: Re: [PATCH v4 2/9] PCI: imx6: Add ref clock for i.MX95 PCIe
Message-ID: <20241022164603.gndz4vgbm2sgwtfj@thinkpad>
References: <1728981213-8771-1-git-send-email-hongxing.zhu@nxp.com>
 <1728981213-8771-3-git-send-email-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1728981213-8771-3-git-send-email-hongxing.zhu@nxp.com>

On Tue, Oct 15, 2024 at 04:33:26PM +0800, Richard Zhu wrote:
> Add "ref" clock to enable reference clock.
> 
> If use external clock, ref clock should point to external reference.
> 
> If use internal clock, CREF_EN in LAST_TO_REG controls reference output,
> which implement in drivers/clk/imx/clk-imx95-blk-ctl.c.
> 

So this means the driver won't work with old devicetrees. Am I right? Then you
are breaking the DT compatibility.

You should make the clock optional in the driver.

- Mani

> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 808d1f105417..52a8b2dc828a 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1480,6 +1480,7 @@ static const char * const imx8mm_clks[] = {"pcie_bus", "pcie", "pcie_aux"};
>  static const char * const imx8mq_clks[] = {"pcie_bus", "pcie", "pcie_phy", "pcie_aux"};
>  static const char * const imx6sx_clks[] = {"pcie_bus", "pcie", "pcie_phy", "pcie_inbound_axi"};
>  static const char * const imx8q_clks[] = {"mstr", "slv", "dbi"};
> +static const char * const imx95_clks[] = {"pcie_bus", "pcie", "pcie_phy", "pcie_aux", "ref"};
>  
>  static const struct imx_pcie_drvdata drvdata[] = {
>  	[IMX6Q] = {
> @@ -1593,8 +1594,8 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  	[IMX95] = {
>  		.variant = IMX95,
>  		.flags = IMX_PCIE_FLAG_HAS_SERDES,
> -		.clk_names = imx8mq_clks,
> -		.clks_cnt = ARRAY_SIZE(imx8mq_clks),
> +		.clk_names = imx95_clks,
> +		.clks_cnt = ARRAY_SIZE(imx95_clks),
>  		.ltssm_off = IMX95_PE0_GEN_CTRL_3,
>  		.ltssm_mask = IMX95_PCIE_LTSSM_EN,
>  		.mode_off[0]  = IMX95_PE0_GEN_CTRL_1,
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்
