Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E0526FD8E
	for <imx@lists.linux.dev>; Tue, 15 Jul 2025 22:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752617825; cv=none; b=oFm3WN4h7Q2xJKiAlaIfSysws6GBDhCdMm2vsb76fGpes0YpFvFap8r0lHAMM01/nhFTUMyZsLkWUyS5qRVcxgdWppHYIIwlnDBf3vwf2H0XOPRUnJtZ8DuXdaG34zgyBwDp0gI2sqRjoNlerqi3PPGx4s0tXtfQ4HEi1eNUAmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752617825; c=relaxed/simple;
	bh=tMdoZBivQy3B+NItaHwOMyR9RE2Vd3YaDfvRU31vZT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tb2o1I8a1BFg+OF5wMvm1CVXLULooBoI5raTr0svrJQpROobR6SmfndU3nqkrbsKexTlUE/ZIfdcchQPaxEIuLINiI4ERfSScb8brVUBkvDLihSoEJ3RQWmvtnONL8d4/k31Tyb8vTdwp+GjK2gkt0QwlmUKRfv1oxbX/HNMIIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=c3NmuSVo; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="c3NmuSVo"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-748e81d37a7so3636213b3a.1
        for <imx@lists.linux.dev>; Tue, 15 Jul 2025 15:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752617823; x=1753222623; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T/kIrHiKONJdy5Cuneuwy/QdepmnycAhgTTDDzUGMMs=;
        b=c3NmuSVobx23h8/KKva8XHKewh6S9xg2Yh/ebnufgF0TiQJ3Hs0pJdt44muDxTi1Hu
         P775m5X7y3tyDJTxvaKrn7VHTzTUHDTsuqRCgc7uVXc/WqtC2+fO3rWjVClORdP5mWJc
         ZqQezOW3EkSdO1HXUluQZMzintV9ZuIaVTScU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752617823; x=1753222623;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/kIrHiKONJdy5Cuneuwy/QdepmnycAhgTTDDzUGMMs=;
        b=C4gT3K4dKJxuBNdMbBhWG0n83QBHP09dDlvUWoNsrMZR3i1/qpMZTYNeclgt99gsWC
         6dHinSXPr0QKwLt880wG+zdfcuupCNbxn1vGtEsEYgLuryA4EDov3tciN+HdVaGKX03K
         U3cu0lDylj7ms2nf3ZcVRrVgEhvoTYsfHrixJ3eV9oJUUVF1y+gMYosQRQKRn2Tznj4o
         67BuOWK9UmZJziqNPxeam6l7YqaIZzEdHFgGF4GoaE7o4nQJURe1nYjjGIngJM02n1N8
         TtYp4YLJBqgCiJDp1aBmhgIu0Mpa3mmWHS26B1KVGwLdai49kwyofaN+Sn2tx7slPNXy
         4fUw==
X-Forwarded-Encrypted: i=1; AJvYcCUKnj8P4vOzMbS4uOvL+7AglfcOxIOwtTnYzesKaX6yr+l/IAs81BwDHCdVBUWjan/my18=@lists.linux.dev
X-Gm-Message-State: AOJu0YzJxKXv8vag9uZbqpJrPNIRu4Zenj9V3hEQ2+jDTOtU74pke0ZP
	i9Lp0sxxSR8zv+84S2rWutgKL+I6+E26avXh6TB5eLuqD0cQUpJ/h1ILtyzoS1MKZg==
X-Gm-Gg: ASbGncsW9pji/g+SU+HAeK/nZ7ixcznefAxHIcxJbtO9wyy0CvTF6gUP7fEuyrZQnD8
	7uYfY8vMDewzrrmI+Kcm8RbDxBtSv+6194FouNVRy+vm2KXK9CPD2batOQejhW39V37Wq4CluwY
	5tdVzyzeeYNK1dNVnZDtJStP7pXEreMZgdxB7OHJRGhuZVR6Mh112YkVxtDxh6kokWTi1BIR9k0
	z65w8T/Pah7BQKrxDtiCLuF+V//LehNjlqVrTR6lWtYHHRQ9iCUjpec1GXB+HOKDLYx7PG0akEE
	zFxpDoGy6upMdzSEfOXez6cmZOyJv3ydpcntxpFECZ5Yb3sMPWRUAXYIP0yf94gY1s0WAD25d4W
	NsubKao5UQR6q65cDNwbCAOOoP7+Ye7Qs3Q/z8gRL1Up3GaCAc0aElzRxo+Xf
X-Google-Smtp-Source: AGHT+IEi35Q/9L2R45q9+Ckvy4VlsxjWRECWaXaVKZkJ79j9LtzQTdHiPF2AYMs8Ki3dyCacVtaadQ==
X-Received: by 2002:a17:903:1c1:b0:23c:8f17:7f45 with SMTP id d9443c01a7336-23e24f70e34mr8439895ad.50.1752617823417;
        Tue, 15 Jul 2025 15:17:03 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:3478:49c2:f75d:9f32])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23de43352b5sm114969135ad.165.2025.07.15.15.17.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 15:17:02 -0700 (PDT)
Date: Tue, 15 Jul 2025 15:17:00 -0700
From: Brian Norris <briannorris@chromium.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	Rob Herring <robh+dt@kernel.org>, imx@lists.linux.dev,
	linux-pci@vger.kernel.org
Subject: Re: Does dwc/pci-layerscape.c support AER?
Message-ID: <aHbTXCYXbxLSQhgK@google.com>
References: <20250702223841.GA1905230@bhelgaas>
 <aGW8NnHUlfv1NO3g@lizhi-Precision-Tower-5810>
 <aGXEcHTfT2k2ayAj@google.com>
 <aGc666o3EgtXQMGN@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGc666o3EgtXQMGN@lizhi-Precision-Tower-5810>

Hi Frank,

Thanks for the response.

On Thu, Jul 03, 2025 at 10:22:35PM -0400, Frank Li wrote:
> I saw AER and PME irq registed. But I have not seen irq increased. I am not
> sure how to inject an error to test it.

I've tested AER-like conditions via one of two ways:

1. force asserting PERST#, and then try to read a config register. This
   should generate Complection Timeouts at least, and possibly other
   errors. This method may not necessarily yield AER logs, as it may
   also reset the error reporting registers that the Linux AER driver
   would expect to read. But it probably should still trigger an
   interrupt.
   This depends on having access to PERST#; many SoCs provide this as a
   GPIO which you could potentially control, although I don't see this
   in the layerscape driver at the moment.
2. asserting HOT RESET in the DWC controller. This is especially
   implementation specific, as it depends on how (if at all) the hot
   reset signal is connected into your SoC.

Not sure if any of that helps you for testing. And maybe you want to
wire up your platform IRQs anyway.

Brian
