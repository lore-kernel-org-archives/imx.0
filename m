Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27B233D518
	for <imx@lists.linux.dev>; Fri, 27 Feb 2026 03:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772164723; cv=pass; b=QHSZQ0RjtIIoKLvUTsSM+DN+T9/ZVvcilRqq1yk+sAE7+ukZsk/jcsmWPWheICvntRkI9bHlj+mg95IlsCzgW78zB1WJQ/uvDpnXK6jWHfY5sTfeqlJb6ETm5jB2IvzvjpO6IILRjeC9M2yd1TvhJOm2GOb/5foRVAkTqgkncI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772164723; c=relaxed/simple;
	bh=p3CbJ3mHKzHIRasaFuKXvprF0Md9KRjhSS/F3cT0x3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WYYXd3Q5Gu4sS7dESNjwK1YfwFJmVGnu1IiZ9qcjQFl6HLnM9YE6G0Xlf6DJUTchjlPWp+NS5RZakC6zwL0SA1HceuJ4Y31J39M1ZeBibLOKaqd7LDiWR6Jm52BpcoGdM06dGBIHVIPUsfWLRJoUoUZUnBJcfhBEhYAkdlI+yoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kifrvYsJ; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kifrvYsJ"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-65bf302471dso1909881a12.1
        for <imx@lists.linux.dev>; Thu, 26 Feb 2026 19:58:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772164720; cv=none;
        d=google.com; s=arc-20240605;
        b=k71cI4dZS+Xrga29QDFEn9sqrXHyuahoWEMxA5GVrilT1UoxFoYa0dk5SX8zaL1Qrv
         JcG9r3L/e4AqxIZsSWRVVMJRSpk7eXGj0gpqJ8B/Vwy5MimUmsMgzjWnFJNni8dfzA6q
         ONbh+8BgBsRQF5nWAedPio5cxyTW9qDaj991M8im6sxdC92HLZRfuR823UYgdU0GcR6X
         FFuVuAqfplMZyJC6n2002z8fRnEn8WVYqztswx/zPVHf7zpC5Mwvw0CAQsEg7eg4x1d9
         f1m9qO690+/gUFC4bsg83KlbzkL1nuzje0G/Z2UW4xJstI/CbGUJAGVKOI/Sn+MLweWk
         9Puw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UDbsVEKZhLBEvaXz/piLWHN8Be3D0IK5o5PnFyICBEw=;
        fh=Gk71cAjSNyBxxRnjG8Tacycn5lQIsuWyewLtBZ6b/Fg=;
        b=GMhD7FUWcxnCmzHQ/UrzjmzbiXmrkKaGtT/vDikYgfob5kO5/96n5IjTryeyT0iy3b
         W7ZedwSUOyMBfeBDfEObn6EJZlDPUjOt4O6/oIhYhuAnUyMu68oDHNp8AX6D5yumXzm3
         jDZvbA+V0Y5XL4eHCPFSXNxbwjIc8qalx9a0/1CjYxN1ohBYLjY0rqpK0nPcRp1FHhNC
         V426194IU43kakeJELwlZmqmLrqGFGR8IVa1zYK+Hc2vahKlWw26c+61Q77Vsg2BoOuq
         JDHlZcDgWygW1D6ngluAOrI2Nh7ymD3igo8Luml2ji7hpmI7UvWX2GQ6wwbgyuAMMDUb
         h0QA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772164720; x=1772769520; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UDbsVEKZhLBEvaXz/piLWHN8Be3D0IK5o5PnFyICBEw=;
        b=kifrvYsJKPQb3qxeqPtMdl618IhqWnrwTr/o+sgNjms/sYJEAfmo40HSRU3ekmsK0+
         4lrjaXcc1v/zv7LwwSFTOibk2gRmiXmElgHYWbGaFiEPJlsU3Dh8a2Kro/eCz34zfC6R
         tUO57u6fyPflLfdqVWu4h951eDAV5Hj5wlYzuy6teGFNDLC3vNxl0bXCrVAypCHCZEAA
         X1b2+Ulp/CesV62Tk0va2OB3SZlJXNjhBTJVZwe1FlYUpswmQ+/GP8JwrvsX92pbMGc7
         4G0uw8ZCzaFM7ZBTF9u0esyAkxW0Zzflm+rFsIcwrpJVqHTQIq5+RrSNTEXfplM6C3Vv
         +lZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772164720; x=1772769520;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UDbsVEKZhLBEvaXz/piLWHN8Be3D0IK5o5PnFyICBEw=;
        b=P7ClCbmjWpPfy1/+9/12iWN14oYh17JAHNawrF3iW3FJjj+tWjgOXNWzDZjSAqsDeM
         oKYB/MZma0zLdBH9ThAIe4g1fFjGvWFWttqH6PWcBHlBYl0yng5FTKhOyMg4ea1Av4/A
         ghjWA2hreIeHWW9QSgJ8u7E5ImNwgdhOCyNucC1rBlI3IyALTFeFaq2O1yi48RiHgHNK
         w/ucSGrQyt3WUjiyoh15CX3S2BsTJPu2j4Q7EPUmK6Ju7kS8xldeKTEfWXWT2TssCj93
         Y5CyDFxz8JbfpE6XTpwGoSaMQcBEuiRCTW/PhUVg+y3kt5vKe+TE48aQMLJwHG+iwqF8
         CzxA==
X-Forwarded-Encrypted: i=1; AJvYcCV79PU1pH/SuM7U8xlVlBMT+KV4LFUe3AHelmS+PfbXXS2FTU6zv3R1cv1hOx2seKwbFOA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzstjPJNZWXkPP2BjeDDEhCdfcmP8RKAs6hV+CPcW6Yq/y6j1Bx
	8fQbDyAtpBkPQ8sIatDljJxvcKVanjeHeNuvnaoDbs57lOpn994okKNxsSWtbk0ekRRsp5SVkRe
	D/meM5t6aYXqfJcLd5jj+l8tyb+4RxDQ=
X-Gm-Gg: ATEYQzxSoTtSL1h408rhddjBhYC3m2zjmtFPvLWz4T3Yhteu+OSZZ4tLC2PEUyhrYsF
	Jyjp4AlneYWvGfioQdT35P6i+4Gr6tem7owFw6X0YQXoOTUZoZWdzFA6Sl+S82LCEd9slsXZayA
	avQPoH/p/pj0Za7WdVCUkO7Kgwa1fb+tBSCtqXx71uSWpxlFdqviMTpRdmNoijm5vTq7ElKWXhL
	IyyTLQ8n8mnAXQY6kFtPbgwLs3FvuoY/HgPuJeT+NKVh1R6WdpKi4qmewszDpmuVqt3DMCAmhUc
	kGLPkao=
X-Received: by 2002:a17:906:fe4d:b0:b86:e938:1b21 with SMTP id
 a640c23a62f3a-b93763b6903mr73471866b.23.1772164719886; Thu, 26 Feb 2026
 19:58:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260129022910.3942028-1-onlywig@gmail.com> <20260129022910.3942028-2-onlywig@gmail.com>
 <aXsdyzZEUaVzC34W@shlinux89> <CAPStFe7ASmYxJdDorJ0KAerfTH51ioZ=89F8fRcs6fBVqqhdUw@mail.gmail.com>
 <aZ4HrSNp32lbnVT-@lizhi-Precision-Tower-5810> <CAPStFe6sFCo2-+9ataPBy9pvEUo_uZ5G7XNA_8jH+sF6=FNOpw@mail.gmail.com>
 <aZ8SAvjCvTyLNi8P@lizhi-Precision-Tower-5810>
In-Reply-To: <aZ8SAvjCvTyLNi8P@lizhi-Precision-Tower-5810>
From: Wig Cheng <onlywig@gmail.com>
Date: Fri, 27 Feb 2026 11:58:27 +0800
X-Gm-Features: AaiRm51WYOya2X-nIX6UgHUWlRFoVIP5ReV9iuqHFak9xmEpTugEBlDhZEMDjhs
Message-ID: <CAPStFe76LVHBrx57_WETToziN+DJq3pz6gpPm7VBaLRjXoxfPg@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] arm64: dts: freescale: add pixpaper display
 overlay for i.MX93 FRDM
To: Frank Li <Frank.li@nxp.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>, shawnguo@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, zaq14760@gmail.com
Content-Type: text/plain; charset="UTF-8"

>
> On Wed, Feb 25, 2026 at 10:11:02PM +0800, Wig Cheng wrote:
> > >
> > > arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtb: display@0 (mayqueen,pixpaper): spi-max-frequency: 5000000 is greater than the maximum of 1000000
> > >         from schema $id: http://devicetree.org/schemas/display/mayqueen,pixpaper.yaml
> > >
> > > Does 1000000 work for spi-max-frequency? or need update binding doc?
> > >
> >
> > Both 1MHz and 5MHz work on i.MX93. I chose 5MHz for better refresh
> > performance, which is within the LPSPI3 controller's capabilities.
> > The 1MHz limit in the binding is a conservative generic value I think.
>
> Okay, let change to 1Mhz first. we will update it after updated binding
> doc.
>
> Frank

Hi Frank,
I've sent v5 with 1MHz as you suggested:
https://lore.kernel.org/all/20260226144819.3428730-2-onlywig@gmail.com/

Thanks for your help,

Wig
