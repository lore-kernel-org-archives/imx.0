Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC8C7603F
	for <imx@lists.linux.dev>; Wed,  7 Feb 2024 12:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707309458; cv=none; b=IJ0OKUmAVG0wBQgkiCIa17wwMWqoSad+6N/476x5h2S8mg30p4Ril9K8izyzx5rDdjyZTVlNOtDr2uyQmUKRDdwmve6g3FJuULehDyDAVnds36y/EM3NHsqNyAndfd4TsHoV12ZH3SCHB4hX/UWar/GBJE+d8Zf4YqKe0NHTHYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707309458; c=relaxed/simple;
	bh=JYSGh6UALamju5u5Q0FvgbPBMp9aifKa7BR1nqjWr8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CzMhCpTFafe2kiDZC1unjcrOBGlgSUKS2VfuTa7Fe7PG+1EEswEalBUe5mSko8Uu/pbaaH3CrAQw+acl+VNzNRbzCbQbpXi76IHLt7hCMhGgM3BrQDPzxsLjHFoOTdbdPVOLKa3yTy+rTjJv/ryQj7FmrneqEdBtsyPeSd93ADw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JIfsKVOx; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JIfsKVOx"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5114b2b3b73so663103e87.0
        for <imx@lists.linux.dev>; Wed, 07 Feb 2024 04:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707309454; x=1707914254; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zGCMNGG4Outy/qci7fXlqmZvH2mFLm4kVAJGLfS6kyc=;
        b=JIfsKVOxxaJv2bMf9GAl3TfyjaDk9ZMlfXUDguc192Zc53HhD5yQslXBaRQ/NvDyLv
         mL8rZ3ptizIgR/ZDOqnKZayfga3LsaklKJkApJ7mdJTa/kIYK9j7Ch/+/98uCVrE0nE1
         KDyPqwLXlvRfTECVDsyIUWwan8hM8/PNwqn9hn+27cVky16xisSea1mzil2G+3Kxg8MR
         kr2LFE7fMq91HukYMTJrlLEYYBrb1mVRiBOErSLtcq3TVKxg/yFfRZFs84hsXG6Q0H7A
         Cpfdv1s9EVcaEkH04D9kv8VAvAJoQk4R02HDPo9iXOny8v0b9rJ3gqdiqc3OhK3r8i6O
         7zYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707309454; x=1707914254;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zGCMNGG4Outy/qci7fXlqmZvH2mFLm4kVAJGLfS6kyc=;
        b=w4Wi0IU9UQc5na9Qrv0TwFaOmAfmixP3AahzE7VXNXDekVzdzwzWN20gWEWooO4A4z
         neof+K4+mhwULzCE9T59guuWyYctFaPn+P3AN4YRCjy/YWo9fiI8VDw+oNsua3giIsfx
         jVJUMuo5aBNO34wMK3i7MS1DuIG/0GUVlcaEmaefAc43ekGbmyiKkAbeWSptG+4nZlSM
         z2SEWzPVFFiHO6BRjvroJ6lUmnPw0zop8YqKLq83fqNOhldBRmenw4GoR3z+U67w8hS/
         sOAb4WiexOYBIr/JjXcNAd2T9u+gNRgkv+Rp8LlKGiErhi1/0Re7IN3ZlzelW2QxLfCA
         2RZA==
X-Gm-Message-State: AOJu0YyHFTwLjVz2XcSD14iWt1pXTIpZaVb++wbexieQkMhBbNT9ELbz
	PqwG3UHNFfY8uzx4uZoiud+ryJBTb0LTXeieRVJ4UKtdeJ1KPgD9
X-Google-Smtp-Source: AGHT+IFmdZIvSukjR3HB+CHNwYdlKLeGdKD2AlYJsMfK/dq72+aokU/wJNSuID6UbnlZyL1HjQOGFw==
X-Received: by 2002:a05:6512:32ab:b0:511:627e:36cd with SMTP id q11-20020a05651232ab00b00511627e36cdmr2765484lfe.24.1707309453846;
        Wed, 07 Feb 2024 04:37:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVSR8gTLtdE6q+cbgDFP453ovI67jbu3o5RbMRzLK9RbioD1CNwftojad54BRvTf2dK3D9SdGo7Rz+RTI9YpNMInSGmopiV34RdOfeX4Vlkrczj7XDDus4iCEXTLj4Wu1Qu/t0651NhofHIbg2K4zm+4azluHsQ4Jl6tXb2b20jXcxzqmtsk0PuPqGeYzIVsJvoriQGSt7Qz0x4kkAg/ef+MXWD5MB9QVc0Eqk5Bv9TfXSI63HN6+l0mY9G1qfXbA+fyWii6uaXJMp30Q1DE8RTiUkTEVyg7RQhkvaCq2tvHgZ9ePJhCHvnkRd8jhZ5lQ/q34ZOprPVtsQXIf9pXQikeIkoHzC88Z8SaEc4ptRSffUA9JjYMoxpX4Qve8lqCoYqt7ag6AOSqgiKFYgV4vWONzD3k7z1HCIutWHGfZNjICvzNTPRzFn6s/1Y0OtDsvaGrlItGFnJKB/KrGE=
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id 8-20020ac25f48000000b005114ee99515sm165135lfz.220.2024.02.07.04.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 04:37:33 -0800 (PST)
Date: Wed, 7 Feb 2024 15:37:30 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Frank Li <Frank.li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 5/6] dt-bindings: PCI: dwc: Add 'msg' register region
Message-ID: <luk5hswq4wnk5p7axml73qih35hio3y3pfnklctbn6rwres62s@mumnvygjh5ch>
References: <20240202-pme_msg-v3-0-ff2af57a02ad@nxp.com>
 <20240202-pme_msg-v3-5-ff2af57a02ad@nxp.com>
 <eg7wrjp5ebz43g37fvebr44nwkoh4rptbtyu76nalbmgbbnqke@4zugpgwesyqd>
 <20240205183048.GA3818249-robh@kernel.org>
 <ZcEzYdZKotBJlR5i@lizhi-Precision-Tower-5810>
 <ZcK2/tmLG9O7CBEH@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZcK2/tmLG9O7CBEH@lizhi-Precision-Tower-5810>

On Tue, Feb 06, 2024 at 05:47:26PM -0500, Frank Li wrote:
> On Mon, Feb 05, 2024 at 02:13:37PM -0500, Frank Li wrote:
> > On Mon, Feb 05, 2024 at 06:30:48PM +0000, Rob Herring wrote:
> > > On Sat, Feb 03, 2024 at 01:44:31AM +0300, Serge Semin wrote:
> > > > On Fri, Feb 02, 2024 at 10:11:27AM -0500, Frank Li wrote:
> > > > > Add an outbound iATU-capable memory-region which will be used to send PCIe
> > > > > message (such as PME_Turn_Off) to peripheral. So all platforms can use
> > > > > common method to send out PME_Turn_Off message by using one outbound iATU.
> > > > > 
> > > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > > ---
> > > > >  Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml | 4 ++++
> > > > >  1 file changed, 4 insertions(+)
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
> > > > > index 022055edbf9e6..25a5420a9ce1e 100644
> > > > > --- a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
> > > > > +++ b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
> > > > > @@ -101,6 +101,10 @@ properties:
> > > > 
> > > > >              Outbound iATU-capable memory-region which will be used to access
> > > > >              the peripheral PCIe devices configuration space.
> > > > >            const: config
> > > > > +        - description:
> > > > > +            Outbound iATU-capable memory-region which will be used to send
> > > > > +            PCIe message (such as PME_Turn_Off) to peripheral.
> > > > > +          const: msg
> > > > 
> > > > Note there is a good chance Rob won't like this change. AFAIR he
> > > > already expressed a concern regarding having the "config" reg-name
> > > > describing a memory space within the outbound iATU memory which is
> > > > normally defined by the "ranges" property. Adding a new reg-entry with
> > > > similar semantics I guess won't receive warm welcome.
> > > 
> > > I do think it is a bit questionable. Ideally, the driver could 
> > > just configure this on its own. However, since we don't describe all of 
> > > the CPU address space (that's input to the iATU) already, that's not 
> > > going to be possible. I suppose we could fix that, but then config space 
> > > would have to be handled differently too.
> > 
> > Sorry, I have not understand what your means. Do you means, you want
> > a "cpu-space", for example, 0x8000000 - 0x9000000 for all ATU. 
> > 
> > Then allocated some space to 'config', 'io', 'memory' and this 'msg'.
> 
> @rob:
> 
>     So far, I think "msg" is feasilbe solution. Or give me some little
> detail direction?

Found the Rob' note about the iATU-space chunks utilized in the reg
property:
https://lore.kernel.org/linux-pci/CAL_JsqLp7QVgxrAZkW=z38iB7SV5VeWH1O6s+DVCm9p338Czdw@mail.gmail.com/

So basically Rob meant back then that
either originally we should have defined a new reg-name like "atu-out"
with the entire outbound iATU CPU-space specified and unpin the
regions like "config"/"ecam"/"msg"/etc from there in the driver
or, well, stick to the chunking further. The later path was chosen
after the patch with the "ecam" reg-name was accepted (see the link
above).

Really ECAM/config space access, custom TLP messages, legacy interrupt
TLPs, etc are all application-specific features. Each of them is
implemented based on a bit specific but basically the same outbound
iATU engine setup. Thus from the "DT is a hardware description" point
of view it would have been enough to describe the entire outbound iATU
CPU address space and then let the software do the space
reconfiguration in runtime based on it' application needs.

* Rob, correct me if am wrong.

On the other hand it's possible to have more than one disjoint CPU
address region handled by the outbound iATU (especially if there is no
AXI-bridge enabled, see XALI - application transmit client interfaces
in HW manual). Thus having a single reg-property might get to be
inapplicable in some cases. Thinking about that got me to an idea.
What about just extending the PCIe "ranges" property flags
(IORESOURCE_TYPE_BITS) with the new ones in this case indicating the
TLP Msg mapping? Thus we can avoid creating app-specific reg-names and
use the flag to define a custom memory range for the TLP messages
generation. At some point it can be also utilized for the config-space
mapping. What do you think?

-Serge(y)

> 
> Frank
> 
> > 
> > Frank
> > 
> > > 
> > > Rob
