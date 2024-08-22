Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091F714E2F6
	for <imx@lists.linux.dev>; Thu, 22 Aug 2024 07:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724310241; cv=none; b=MwC2ZCLCdjZZOVsfLDF3mWSCLTVvxcFWcG7DY+o4ZbrOjWOtSCi49lXfsHepPZdj0KW02OgdAW+I8y704Qa2JN6VTHF+TIqdwbFoa3rdzBTML3i2+NS8eegSu65Qzw6b4pmdrCUwH/ioeVM8DHJNWgZpcentxo35jjcLELHgZbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724310241; c=relaxed/simple;
	bh=0OUiYBTYz4oLdID1hp1Q3hqIxxyDAqx40ZxJ4IV9yfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tGKhVnzTJBQYKIk1bxNQP6DY8GVgEQ3KR/zqoIIn4nYz5C/l1NPGrHoVS8RP8p208ojtkHwoAP41czqdwg4cBuGNMUHgH8Xxxhs07BDSCCXtZd2TX93WaZ6HQRwxD2QX6kaYO9oHjCi66K9QL96FIIUcYydGylMP5qP1F9FOimc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4280ca0791bso3005135e9.1
        for <imx@lists.linux.dev>; Thu, 22 Aug 2024 00:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724310238; x=1724915038;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Khx5nzpT3raBy31D8+7UGnIXzDyOjDeoWckOKCUba4=;
        b=DoXRzCQuNDtQeCAu41GkkPRkcppSBc9/BDEs3U6otjqpnjIfMkAh0rgYfqBlCoD6Ko
         6CcxQXc+uXpI781ZwyP8bBI24LK/XVMV3l0FN+9eEuOITEyFbYsGu9hQxIUHZwJISHQJ
         e1q2lotwvS1sv+IRMuUrhWAsLZPU2KjzPtpk2zXaVPz1qIj2uZZd9+MO9ZWJJ+MQjIxI
         BDb/3ne8GIQ6ceBW2/IAswx5u+2n/VdDOMEXq9eo59Br2TDEutY8yVeb9WypjMlvFozI
         D8lVD7heAd3G45N9X1G+NX6iQX2Z+scdqE96Kz1bpA98ZMSn8WqoVXFygi9iPmd+zFO3
         SVfg==
X-Forwarded-Encrypted: i=1; AJvYcCWG4A6QpEz/nKEKWtF4ANPcXxdS+VswJhSB1quB+O8J2Tw/tC/pYqhEEvUqeBvggsQhWKI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwakIzRy9RvmeAlP+XlaisR4mV4xR/0JmKYR7WqB5XWP3LIKJCp
	elJ3fkOZwIgDzT/49VBH0JlY0bOubenZd4967hBbzwtwInWkBU9PS3IgnQ==
X-Google-Smtp-Source: AGHT+IEXXiHDWi5aTgV0Or64b+LypSubUzhwenYosJv1sTe/V8fBea7ezUv8rGMBVQcOqUpIkp4nAw==
X-Received: by 2002:a05:600c:358f:b0:427:9922:4526 with SMTP id 5b1f17b1804b1-42abd11218fmr28255955e9.7.1724310237850;
        Thu, 22 Aug 2024 00:03:57 -0700 (PDT)
Received: from krzk-bin ([178.197.222.82])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42ac5162505sm13749665e9.28.2024.08.22.00.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 00:03:57 -0700 (PDT)
Date: Thu, 22 Aug 2024 09:03:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	"open list:NXP PTN5150A CC LOGIC AND EXTCON DRIVER" <linux-kernel@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v4 1/1] dt-bindings: extcon: ptn5150: add child node port
Message-ID: <dbgv5ovohwlfoamgt2zm6ynorzxh63355m2vtxvnpt2gsa2xcp@ou5tvz2ajd7g>
References: <20240820143911.444048-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240820143911.444048-1-Frank.Li@nxp.com>

On Tue, Aug 20, 2024 at 10:39:11AM -0400, Frank Li wrote:
> Add child node 'port' to allow connect to usb controller to do role-switch
> if id pin of ptn5150 have not connected to chip's usb ID function pin.
> 
> Fix below warning:
> arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dtb: typec@3d: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
>         from schema $id: http://devicetree.org/schemas/extcon/extcon-ptn5150.yaml
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

