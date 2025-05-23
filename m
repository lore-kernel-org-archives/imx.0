Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A2F1CAA6D
	for <imx@lists.linux.dev>; Fri, 23 May 2025 19:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748027843; cv=none; b=R5z0hYgui2MG8ha3/zgJmV9hVq3nfLkQanju4s1k9GQrpH+4PRtQRrTE+Fp12ogvAxPEQsm6qs7hca9SD0Bll2ZbzpShyWGQIhZKRSNJkf4SX7Ofm23qXWU/jS1sECjN6jBnJCljqgPp2YO3RRfhzdIB27/xJYSXD5/YJsQt2UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748027843; c=relaxed/simple;
	bh=bFMZT6KPHyJo8o682Akz5XInGdRA7eFxGiUjifeK0QA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ofMdzHh1AUfOrCclGHsXGMvnYIsLNUdbN0SX/XJ4Oc6dVsuLSnnxJPLkIzFOEjVl/03M0N0GDmzlrcW0nrVON8CpuS3x3FVg3H2+VfiIaJ5LtaE4BXHMnxUGaOllNh1sfqmYScTdkZ8hpoXWw9pi0EmnPnYNyt3hIizQltvgSPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fhsfrpUp; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fhsfrpUp"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-742af84818cso233825b3a.1
        for <imx@lists.linux.dev>; Fri, 23 May 2025 12:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748027840; x=1748632640; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qhEtoDJFgqNSJbdEuU9qcTn/W9vRw2JPWBizPEbsfUA=;
        b=fhsfrpUpbc9WequSRFUoSiDy2DlT3ptuZbSsBVs/3KpSPGKJ1bkbYzvrCJCyGaScsE
         FxmTi1LzVt3+U/sGsT4lhqOh7vFxxkeVQL4/7bqDs2nzwN1eWti0kGoEf0aSta2+ru5F
         Oe7/c/vSw+adbp3nxFN8bk+lr7v+LN4poTjb3RAWBL5zco4BJbQcg7E9uDQHupuqIV/e
         mTba1z7qlCZ0BAv7dGfYQdC2e18DVjmC+IlNcQ3N9nnJqe7McZ78NjDWwGpBgH9tg//s
         /xfbhlrO27jYvus5kixxYh9bziorhCAq1pXGGFgBcBXB8zf99LoToCACUM2psuJqAfAW
         q5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748027840; x=1748632640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhEtoDJFgqNSJbdEuU9qcTn/W9vRw2JPWBizPEbsfUA=;
        b=QusjEMrTjMRlKd1bz9kyL9AdKwZKznBaZoa/PLzYWxx/h99F5mem+FU6N/oZxalbXs
         ONJiQR5bCkIU/SdBupZGICAubd0x/w9j4GaZYPsHW/jQtu9xW9ErCInM5wWSYxfTz8k5
         9UnPXXhHMOypFC+ZUE+d5p8d4r15u4JNCZt7FL1PWrgd3aF6GilfH51gqqYNtEONT0s5
         ScUg5nPugwd9Q3XjziEDscPYhtB3dnKN3vfuUOy0kXYlZrcNpA62MUqbcMTYu6En45u7
         JXiI80hx/uq/phEKp0H6LswnBZqGW+2TJ97OZxAc1Xnbp0hT0dK1FO+m0KsJGUbRaKmz
         Frgw==
X-Forwarded-Encrypted: i=1; AJvYcCUmWSTuSAAG7P81hVxMtTdJIsFYU6Ae6hCkjOSql8DB4ECVcpIN5RO+v2i7FmfHsuziw4U=@lists.linux.dev
X-Gm-Message-State: AOJu0YwhcJyWhcWW+Qeyut6nwTeSmrUZDSIP9KAIL89BSej6CdxVVyAT
	i1msVCX77+nL6YUpH/mzT9uNtfVEXuf3LBTrnkeaCOdZ0qa10O1tRc9z
X-Gm-Gg: ASbGncvmRQCOv++qNgFN7GizUse2Z2oDP0NXUBB3O/ySDlbJtbH77QiZRVZhJxO7SKI
	MEGY8Ol3FkBovQ1ek+avpUUPRlyod3ApNq7V4vW6TERmJ6rob4JNREd+rq8kgw5ikQ5O6Ce14W3
	4UST+aBUUgZngsO4AJDJupypgPmzyaDD3hkPH7heHZhQciwYQaAxhCCXDJhFUQDYIbPcgLv9UOf
	PkCiwPal/FGk0t/cm17seWaeYlVckOgRjaZ1ke6QCLTDWZedSyao3JfLQ3xbfN1/V+Kz2NyQOm+
	XbE/ZSsk5ZJb3jx58rytAJ2AYQprzzkCuhQSMDt0T9Zn1Z7o1g==
X-Google-Smtp-Source: AGHT+IEy3i3+lFOy6NK8IpvlSKcpSA+dK81IKK+t2Fb56IqXUml/sv8htV/OjA+M+GMx2IQe7GLtuQ==
X-Received: by 2002:a05:6a21:7702:b0:218:bbb:c13d with SMTP id adf61e73a8af0-2188c2678b1mr659033637.13.1748027839737;
        Fri, 23 May 2025 12:17:19 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96e5867sm13118261b3a.1.2025.05.23.12.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 12:17:18 -0700 (PDT)
Date: Fri, 23 May 2025 16:17:13 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Peng Fan <peng.fan@oss.nxp.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 3/3] remoteproc: imx_rproc: add power mode check for
 remote core attachment
Message-ID: <20250523191713.nylhi74jq6z4hqmr@hiago-nb>
References: <CAPDyKFrHD1hVCfOK-JV5FJM+Cd9DoKKZGKcC94fxx6_9Bsri1g@mail.gmail.com>
 <20250508202826.33bke6atcvqdkfa4@hiago-nb>
 <CAPDyKFr3yF=yYZ=Xo5FicvSbDPOTx7+fMwc8dMCLYKPBMEtCKA@mail.gmail.com>
 <20250509191308.6i3ydftzork3sv5c@hiago-nb>
 <CAPDyKFpnLzk5YR3piksGhdB8ZoGNCzmweBTxm_rDX5=vjLFxqQ@mail.gmail.com>
 <20250519172357.vfnwehrbkk24vkge@hiago-nb>
 <CAPDyKFpGcgMzOUHf-JTRTLBviFdLdbjZKrMm8yd37ZqJ1nfkHw@mail.gmail.com>
 <20250521041306.GA28017@nxa18884-linux>
 <20250521041840.GB28017@nxa18884-linux>
 <CAPDyKFpSb+KsfDr1-=uk4TF4Op1dUQ9rDwPP5sSpMfxDRDhnZA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFpSb+KsfDr1-=uk4TF4Op1dUQ9rDwPP5sSpMfxDRDhnZA@mail.gmail.com>

Hi Ulf,

On Wed, May 21, 2025 at 02:11:02PM +0200, Ulf Hansson wrote:
> You should not provide any flag (or attach_data to
> dev_pm_domain_attach_list()) at all. In other words just call
> dev_pm_domain_attach_list(dev, NULL, &priv->pd_list), similar to how
> drivers/remoteproc/imx_dsp_rproc.c does it.
> 
> In this way, the device_link is created by making the platform->dev
> the consumer and by keeping the supplier-devices (corresponding to the
> genpds) in RPM_SUSPENDED state.
> 
> The PM domains (genpds) are then left in their current state, which
> should allow us to call dev_pm_genpd_is_on() for the corresponding
> supplier-devices, to figure out whether the bootloader turned them on
> or not, I think.
> 
> Moreover, to make sure the genpds are turned on when needed, we also
> need to call pm_runtime_enable(platform->dev) and
> pm_runtime_get_sync(platform->dev). The easiest approach is probably
> to do that during ->probe() - and then as an improvement on top you
> may want to implement more fine-grained support for runtime PM.
> 
> [...]
> 
> Kind regards
> Uffe

I did some tests here and I might be missing something. I used the
dev_pm_genpd_is_on() inside imx_rproc.c with the following changes:

@@ -902,7 +902,12 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
        if (dev->pm_domain)
                return 0;

        ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
+       printk("hfranco: returned pd devs is %d", ret);
+       for (int i = 0; i < ret; i++) {
+               test = dev_pm_genpd_is_on(priv->pd_list->pd_devs[i]);
+               printk("hfranco: returned value is %d", test);
+       }
        return ret < 0 ? ret : 0;
 }

This was a quick test to check the returned value, and it always return
1 for both pds, even if I did not boot the remote core.

So I was wondering if it was because of PD_FLAG_DEV_LINK_ON, I removed
it and passed NULL to dev_pm_domain_attach_list(). Booting the kernel
now it correctly reports 0 for both pds, however when I start the
remote core with a hello world firmware and boot the kernel, the CPU
resets with a fault reset ("Reset cause: SCFW fault reset").

I added both pm functions to probe, just to test:

@@ -1152,6 +1158,9 @@ static int imx_rproc_probe(struct platform_device *pdev)
                goto err_put_clk;
        }

+       pm_runtime_enable(dev);
+       pm_runtime_get_sync(dev);
+
        return 0

Now the kernel boot with the remote core running, but it still returns
0 from dev_pm_genpd_is_on(). So basically now it always returns 0, with
or without the remote core running.

I tried to move pm_runtime_get_sync() to .prepare function but it make
the kernel not boot anymore (with the SCU fault reset).

Do you have any suggestions? Am I doing something wrong with these PDs?

Best regards,
Hiago.
