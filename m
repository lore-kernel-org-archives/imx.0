Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B692E542A
	for <imx@lists.linux.dev>; Thu,  6 Nov 2025 17:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762450454; cv=none; b=LSciG+Dqo77ANXhNCFj4Ja/k5qW6JQPxLcMOOZ/logdU1AK3AqJzmJ8I9g6SQRlrvh5NbKYv2ZWBKp1vhboAHLZibo9q8obrvsHcTCjLh0+DUW360Y1Jq2Uon4AfaEoHpiSAkL9kVGNhW4PzdXjCLvh6dLZEu6KiZ7uNnJWebq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762450454; c=relaxed/simple;
	bh=xC5jpduGSYvNExHOxUniHoKwme79jjzk7c0JLPQ4BHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=scl4Qa/8b9xfv1His1QxgfmrwxYKyxLwTI21vFhj27lDNqLiHNb2LjNS4xb2jZD4PQLjXfA9H85A1OgN/Y4nDEBtSG4ykcU+WQVuH3YmqNzULBAdJ5cNnNnwIAv87YEesAolYYZen2883Upou2bgOE7nffFMY34CkbykrRQqsuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VR9KZ5ds; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VR9KZ5ds"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-63b9da57cecso1882855a12.0
        for <imx@lists.linux.dev>; Thu, 06 Nov 2025 09:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762450450; x=1763055250; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UVFA7b5QNQKKgbY4Sgbk0fAZQJ8jQ8t0W8uUVANJyQ0=;
        b=VR9KZ5dsfunOJW0mk7SWr159usig7DjTsOtB50MSM3QX5SgLbMWaVqe/cV9ScbbZ/h
         MdnbogS4kEroWgtdpx1WB2gs9RbWybH0UunrNYPqM20dKG8F7EpwdIN2IvMX75L3gL54
         kdDzMUQJOMm8RpXQySTuuogF51ZlLzVdRSBZFjc3WlpdWX2IKPTFj589+YeJqA+N/E9d
         erMXIGh4zJvQgOfjRVPSkwkbnk59sW6DsadM0G7vSiWMSJ3BT/R25+HW7xpfem6MjF1U
         64f26S55q4Yq9v+aXAJtbLuN9pfjcxplsEjLyG/bUqZ1EUsTBao3DOgKrOCsTDB9x7aJ
         7PAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762450450; x=1763055250;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UVFA7b5QNQKKgbY4Sgbk0fAZQJ8jQ8t0W8uUVANJyQ0=;
        b=A/hlb/Sht+uhbLQinGPY9Ot61TLgSsl/njWYX3JVj79vIEzMCUGEPiNkiEJPf5wdRy
         3TNGuYoefpX4iMVvNAr1+QTYIrjFpaIV+1YVzkrOD+ZXsLIbvO+0CTxbwfE+IRUhe1yI
         Zfum+lsh3w+d9Xl0TN5x1Xn1wa4WesMb+aYMTDT930ytui8vOpNjhi0F7cjnjJMQM/Io
         uugluRy38vKROR1rOn27fEymJr9JviweLJb0HLE4/ebBkawum0t2JZjbxBopuQi+5gRm
         4dawdEw7XgjGGLhYbY/RU6IRC1UPrIJSWwrEsg+fodBgv209apgvqQRK+0D6PO9NgWTG
         0RXw==
X-Forwarded-Encrypted: i=1; AJvYcCVyoouLvhYwwIsfTtz/WnigfAL0Wvoai5zYMc0/SFC2SpGH2/fetdcpJA9PrrfNNNdDM24=@lists.linux.dev
X-Gm-Message-State: AOJu0YyAqscO5ag90i7w2TQX3+vAh0lKImxGlNQ8C9I1z2WYg/sUPSO2
	NC5qI+wRE4WuCBflpp28sSGM+ch7i4GL8lcdhc22zxmEXKegLwpq7O6p4SzlobA7J+TvtNFqBfT
	Fpz6vVrB/BDazseAqevM5iOwzZp4G4PL5EdakvE8pXw==
X-Gm-Gg: ASbGnct0QYfkVhHL6TgMZVtmpK0ye6LEZ5Jp+/fvtkvclyniyd8N7rUO261rVvwhkHh
	Mq+RW8/grhQJSbXsjwWALHyVClyiySTLwlR8bzyo/L7Q2SavDBR093h6+SMyjqtXYK92C9NVBP2
	Q6gsVchrQBfl6kKcIQdCVfRPSLxqeu0eY2eOL9mUawVb2K3xp+OenaFHX2rT7W+sZEAHChRrQoc
	ZOdwlKnZUUTqldeIbkKkOUEYpbJg62BRggZ3JvhBmfU2Np5Op+HJW/yZXhekA==
X-Google-Smtp-Source: AGHT+IHa3dttDqTITgV3tGTkp6TSuSmsFY+1K88280Yqh8YjVvfMj6OJH0DKtk3h1bhQap8rFtBGhpjoLqExb/O6Ijo=
X-Received: by 2002:a05:6402:35c3:b0:641:3090:cba3 with SMTP id
 4fb4d7f45d1cf-6413f094b4amr145941a12.37.1762450450078; Thu, 06 Nov 2025
 09:34:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251022174309.1180931-4-vincent.guittot@linaro.org> <20251106172312.GA1931285@bhelgaas>
In-Reply-To: <20251106172312.GA1931285@bhelgaas>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 6 Nov 2025 18:33:58 +0100
X-Gm-Features: AWmQ_bnxeRp9L3wzoigXubjMbIkUdPeZ-SXfzJV0HZAKsvwmODUh-S8pANI5ZcY
Message-ID: <CAKfTPtDn8r-YfgspLscd=4oE0GukFg6tORpsUqd7fUs7DJqnLA@mail.gmail.com>
Subject: Re: [PATCH 3/4 v3] PCI: s32g: Add initial PCIe support (RC)
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: chester62515@gmail.com, mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com, 
	s32@nxp.com, bhelgaas@google.com, jingoohan1@gmail.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com, 
	Ghennadi.Procopciuc@nxp.com, ciprianmarian.costea@nxp.com, 
	bogdan.hamciuc@nxp.com, Frank.li@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	cassel@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Nov 2025 at 18:23, Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Wed, Oct 22, 2025 at 07:43:08PM +0200, Vincent Guittot wrote:
> > Add initial support of the PCIe controller for S32G Soc family. Only
> > host mode is supported.
>
> > +config PCIE_NXP_S32G
> > +     tristate "NXP S32G PCIe controller (host mode)"
> > +     depends on ARCH_S32 || COMPILE_TEST
> > +     select PCIE_DW_HOST
> > +     help
> > +       Enable support for the PCIe controller in NXP S32G based boards to
> > +       work in Host mode. The controller is based on DesignWare IP and
> > +       can work either as RC or EP. In order to enable host-specific
> > +       features PCIE_S32G must be selected.
>
> Did you mean PCIE_NXP_S32G here?
>
> PCIE_S32G itself doesn't appear in this series.

Yes I failed to rename this one.
