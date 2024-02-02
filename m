Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080695FF01
	for <imx@lists.linux.dev>; Fri,  2 Feb 2024 22:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706913877; cv=none; b=e2E8rCmvhTSpZNk60IrKg2Ozqr9ZurBf2dmnAgZ+qrboMV/mH5YTL9EaizX+qYU8+ParO3EnNLwckySse2vaK9uOn/EakuWBALf9O6OkOhyMeodlU5c5Hl8UxCFCI46G41OYs1pZXY+TX3vbQc/NTb9N9yHSZsu1bJNioLMzDHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706913877; c=relaxed/simple;
	bh=F0f3mIF6kNQTgYmfkHFIWR2e4gFbkQfXa2m81le8nLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gissrF4cM4z4rrvTn4eGQZYsNG2E349GHkILS0U3MzNRkPP1ZpW+YzX7OuJkTBomZzjgx7htTGiEo3j5ec7KTJHFnmvw2c0QbifV1W+dcZVXpdSkJ/q9i5SlSPIUGJBgPasyzX862haRU5muMHoG/2kZjJqOe+i+0Jsy43AtJZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQCUZJco; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQCUZJco"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51138ecc651so1466941e87.2
        for <imx@lists.linux.dev>; Fri, 02 Feb 2024 14:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706913874; x=1707518674; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3vVXVUVZFy6LOtqzDLB4UhBUfynLaccAy5a3T9ufPos=;
        b=bQCUZJcoJxUSAZebniXb1pCUsLicfzo9iOaSMlqzJKUhceMGqBUyBeT9jeVSWR6wtE
         M2Of6B0a38u6e8j695JkZYsZoreI5eU8PyRKYuwyOApESZjdy+IzbAmy+TUgTvh0CmPO
         +/GbqxAf7JDCH4A6urHbNRsRRIrZqvxqlogqPyExG9ELfGK9Gfu4c+eQ+ul3LJLIEbbt
         c4XOunV33bnONDr4zL9HhOCo5ry9362LucURYOAEr9Ch2exWfOriwpfQxbIDP+Uk6T8u
         sei96lO5sJg+LWkkpGtp5YHNSK1GpFwY6RYAQOnpDtgjcl9yVOJfXkPkEp90be39N44o
         m/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706913874; x=1707518674;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vVXVUVZFy6LOtqzDLB4UhBUfynLaccAy5a3T9ufPos=;
        b=wkK5cPwyr3LrycGqeWfbOl559DJLfzwP8UaDnI1fbv+zlCYz1/Szq4BlOHbVqtY0LX
         C+RtI4S8EOYu/1wLJj67QjYqcWoWf0y4EmGHI91tlK3cCt32Lxh8hsI0mjAeOxd7iKph
         FeWhSQGgUXynlV0nRSR+XuleoIK7SdyhBT+svajMSIF8Tdv+4SnYpQCplDYJoy3ujYN4
         e4vMS0f77gwtOZA+RpgREDsyWdoxvJrHS9aWKwHnMzL4wmqCbfNlBomV9IuYHnqGSB+5
         ZqmJWA5IeAje7Ileo4xYCcH8spiEvs7J2gbwlCwAuKva9vPnX7/P+S7zTlaa8z0+0uqM
         kaKg==
X-Gm-Message-State: AOJu0YwVihw0i8SWAuSEBl9yjPk7k3MBq/vm9qQDrxZfGUPj3BbWt3bI
	m2kw0BOrqCFv6emkrXReOAwtAGYvNABXYhtxOgcgg/pSVSLZKMVO
X-Google-Smtp-Source: AGHT+IEOxWOFJPQvIYKMDswUkt17uWOHCphm942daxHLEHnaa2FX9s2cDvfQNs/oCGDGYJvFTXn47w==
X-Received: by 2002:ac2:5e79:0:b0:511:3a20:e116 with SMTP id a25-20020ac25e79000000b005113a20e116mr1504359lfr.11.1706913873840;
        Fri, 02 Feb 2024 14:44:33 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWlxGb/q6EXr636pLRJcb7r2TsFDhV8wffFuzODQUkrYBKy06T6lufqZDnaBBfq5RgscpXT4INxjoyXrIAY3tFb3hiqgoNBHbx/bsgpoS7n7CZR2R1w0r3KvfrLx5HJkAcqtzc4omCeP5nJ/CgFygeFEfu258Sa/CXT3+ZtO5j6fJqsP71x+B+fve7ANOPMTvWwfDTVBdjFxB2RY2wDbec9QS1eyOUWhY1VWjESs5+rLrTqedSk4hjVQ6J+Qblj6QlaS4JpeXQxn4Lo8Q+3mifl5g5QrGR5x5DP8+Pn9b0gS/gDiVYJfUfplfurkzHKB1ngdgaAzPSHffJ1qA/ANRcfoIqcyeDeOlVeVc2eL7lBh6L5mJd3A97IxQJADDm0g4eDW+0EvFTEp22Gz1WND/HaS3bOtiCqLQOoMaAauJjna1DNhqUlNrI9AxWS2+CMEwxahOb4HtU/b2NJB3E=
Received: from mobilestation ([95.79.203.166])
        by smtp.gmail.com with ESMTPSA id u13-20020ac24c2d000000b0050eacc0c80bsm429821lfq.131.2024.02.02.14.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 14:44:33 -0800 (PST)
Date: Sat, 3 Feb 2024 01:44:31 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Frank Li <Frank.Li@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Rob Herring <robh@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 5/6] dt-bindings: PCI: dwc: Add 'msg' register region
Message-ID: <eg7wrjp5ebz43g37fvebr44nwkoh4rptbtyu76nalbmgbbnqke@4zugpgwesyqd>
References: <20240202-pme_msg-v3-0-ff2af57a02ad@nxp.com>
 <20240202-pme_msg-v3-5-ff2af57a02ad@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240202-pme_msg-v3-5-ff2af57a02ad@nxp.com>

On Fri, Feb 02, 2024 at 10:11:27AM -0500, Frank Li wrote:
> Add an outbound iATU-capable memory-region which will be used to send PCIe
> message (such as PME_Turn_Off) to peripheral. So all platforms can use
> common method to send out PME_Turn_Off message by using one outbound iATU.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
> index 022055edbf9e6..25a5420a9ce1e 100644
> --- a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
> @@ -101,6 +101,10 @@ properties:

>              Outbound iATU-capable memory-region which will be used to access
>              the peripheral PCIe devices configuration space.
>            const: config
> +        - description:
> +            Outbound iATU-capable memory-region which will be used to send
> +            PCIe message (such as PME_Turn_Off) to peripheral.
> +          const: msg

Note there is a good chance Rob won't like this change. AFAIR he
already expressed a concern regarding having the "config" reg-name
describing a memory space within the outbound iATU memory which is
normally defined by the "ranges" property. Adding a new reg-entry with
similar semantics I guess won't receive warm welcome.

-Serge(y)


>          - description:
>              Vendor-specific CSR names. Consider using the generic names above
>              for new bindings.
> 
> -- 
> 2.34.1
> 
> 
