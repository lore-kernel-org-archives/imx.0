Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9078B233708
	for <imx@lists.linux.dev>; Wed,  2 Apr 2025 07:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743577662; cv=none; b=D6q996zfrrfiPAwlvwc+L8LDHk9CRtbLgbQgvbxnbtr1npH2EGrZP7ofw3FVAJ/0wAOp1l2NXTl9Xj5qwcFkJ2bAdtIwl6x66bvPiNLNYxFNifNjiI19LN9+LkG+1hfR1vneR1dxBrsWKNu5zPi+iRuKdpZIUYkv+KGPHK99yf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743577662; c=relaxed/simple;
	bh=NnWGuHjIyJg5ukrQmVNz2nsRNWILWqsyGsXJg48Opm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U+BKOzUWJFRE7DIWnZ6So9wGucW2lI/wm6rJVgbcueK1Dt+bb9oz8sHkFqLVgvU22xqD/W4V6GLRb8jfR4CXKkdAwVuqFcpYCEYYAWxf0+OTCapzQfBKyD9uw45dZBVU5zoe+SFw3zDZXK9eMUY/KJXYmkt75jmjZCVsdiA/AzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WavSZVwH; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WavSZVwH"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3032aa1b764so8211517a91.1
        for <imx@lists.linux.dev>; Wed, 02 Apr 2025 00:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743577660; x=1744182460; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IhuADULP2/DYR+/MqPtSI6Cci67OQxTxzfXSmiaFrjc=;
        b=WavSZVwHnutnNZzfGqk8USkZ8hDzWB7NGT/nUcs+dHyFd8NIcRT55jGHWn3wJC+YGp
         lquMRyFJcEl0RCU5Ld/v+ur3yJaqydBggz+/AA4UGYBN2oK3ZC3ERuI+7gVeT7lc/2mh
         WWq3z6JQwzbR3djYxPfWI+jqc+CT7WO0ZVMMldRLyIIcoKNJBwosc3e5j6BGyk+U0hGn
         YtxW70b+/UWKCZOZPXyLzOduZ6cb67F20C4Tm68HcRzQahziCyY0O8gmwxFEHePkPWBq
         sKanTeoSHVj7uTkaoYpxYAubfkqQr7UfHNfL+5qF96CTrfDbgZoPMKIz4bsIFBw+DbkB
         9r5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577660; x=1744182460;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IhuADULP2/DYR+/MqPtSI6Cci67OQxTxzfXSmiaFrjc=;
        b=ZzLaMQ/pB/7Bp7SMuPSLfvqpgvG/Coa+po5uFoDwGswNKqXDt9AaFs7jNhtj45goek
         WFZLwPOxeWTXvYWQPrBQKsmIgKiLdTrDt+VoJ6H+LIcO1oDETRpokEW41XUuwB4afJC/
         ukn1yB5ZgSZeT6RjpuNWfV0YiairFCdOFJlTYAJjpEYmtAYSFNeYa5x7nPhmrUz57UN9
         R9mF8fm3T9rVx6GnYQBeNeiPVnOL5UA4T/HYVK/t2locn5voBxrJF+B4vGgPqqmiAhE4
         P4qCPTtDPPWUoWhTlkAni15DPQWbg8h+1lgXlXMMVKE5vtJRwZ2VmFF8nIAU3Z89j9xd
         iyZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKrV0XwEPqwM+WMuWBDriMJnK3lTCpKvIGubUjbmimayCFYgzpz2ojmaCdvpYlAhqlxJc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzVaJlCuYGx7QPVejDWGJ3b4CSGLPkJaLB3mmvMWzSDCWBrOQQB
	Hyvmm6+207LulyJ0KfS7gUPNw3y0X4Qm8tc6JLOFpM9GDFZ8+BBqk9RYptyMXA==
X-Gm-Gg: ASbGncsmY0e6o6LDa/CbrX4btM7ALJ9iM/WyVH+Qheiet+8FlGBp8uMKtMigXJoOE2h
	w3ssu92iBvROQr0Tuwriq1+rGTJeyPwhoAq+qdEb5hmjK1NC6zYbpfffNgP3pO/Wnj6C4zCfbEd
	GDyYRTVMnueRxw0Lff9HHErKowhbXyBZ94aIgaYRv1SvCBvEuuVpJ4MfToaqR1UlCo2CsWwvROC
	1Zni+cV4t4dsFB5tSjCkS/AvwwcqU6KHhzc/vZL5OGR9LBgCrt5N18B510u86FSw4TL5T1RMfBr
	HQ9VHJACGB/3Di4nW8rA7VRC/uS1E6v74oN1rkS66fkSkuYFJXZnzZtvXNM4e/la6mU=
X-Google-Smtp-Source: AGHT+IE4wHP6J9GXf8X7N3O4gyhGdGcC+e9u9+l3c8VFMifgnYsypn4gjUxr5vUgHQch7GtGcGvLkQ==
X-Received: by 2002:a17:90b:4f4b:b0:2ee:c2b5:97a0 with SMTP id 98e67ed59e1d1-3053214596cmr20228761a91.25.1743577659803;
        Wed, 02 Apr 2025 00:07:39 -0700 (PDT)
Received: from thinkpad ([120.56.205.103])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eec71besm101393275ad.14.2025.04.02.00.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:07:39 -0700 (PDT)
Date: Wed, 2 Apr 2025 12:37:34 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/6] PCI: imx6: Workaround i.MX95 PCIe may not exit
 L23 ready
Message-ID: <ovaomfvo7b3uxoss3tzhrkgdy6cvxi4kr2zxmqsfjxds5qfohl@t6kc4rswq6gp>
References: <20250328030213.1650990-1-hongxing.zhu@nxp.com>
 <20250328030213.1650990-4-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328030213.1650990-4-hongxing.zhu@nxp.com>

On Fri, Mar 28, 2025 at 11:02:10AM +0800, Richard Zhu wrote:
> ERR051624: The Controller Without Vaux Cannot Exit L23 Ready Through Beacon
> or PERST# De-assertion

Is it possible to share the link to the erratum?

> 
> When the auxiliary power is not available, the controller cannot exit from
> L23 Ready with beacon or PERST# de-assertion when main power is not
> removed.
> 

I don't understand how the presence of Vaux affects the controller. Same goes
for PERST# deassertion. How does that relate to Vaux? Is this erratum for
a specific endpoint behavior?

- Mani

-- 
மணிவண்ணன் சதாசிவம்
