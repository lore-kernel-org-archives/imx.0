Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BC42D627
	for <imx@lists.linux.dev>; Tue, 20 Aug 2024 07:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724139889; cv=none; b=dZPK9Mt9HNg8F+1fbvP7E8QXO6QM0u+psbTsNUL69fzdsV6RHDGIVfztrIdqIfQ2wliyfWvBLyGcrsuQF3yXfIwF2KbgxDpKiUq9MlBtiFQs88ZNVxxTIAR7SlYy/WYdke4ZfE51WYlcitc7WAOokBgIP4GbUySUKVU6Nf6eHUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724139889; c=relaxed/simple;
	bh=lf3gpRbFA+B3yZkvMYoYyM4mP/3oycLIzK0/eFbOelg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UsYE0rqR+SlwvyrZiOFQlrJ1U8zMeQ8oNyPTPkV8EdS28pIOKN4H2H/buvRzIpuGjd1NT976Rg2ZK2I+xz9e8lxqaoQNIxpQqMQ+X7my9rPIp8b4J0UKCNRkQ1plhGSELLY4jmk1XuTP++QhXLl44yXxZkHjNnxGm2SdIBdfQkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-428178fc07eso39201695e9.3
        for <imx@lists.linux.dev>; Tue, 20 Aug 2024 00:44:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724139886; x=1724744686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FvbirHJqUDXw1rweSKspUbcKFVV/FBP86r3X7Gn+7xk=;
        b=UdF6QWgEphVc1aPmuwSEd1+fv8awVkNqoeag9KLijOvlRFmxvCd4XjHsqLrsLYYQQx
         lM66P5cb+sD6bcaW/v3A0npdqheK81aCdJOmt6gFlUyfxzL2401KlImP6OtOWXnutML8
         ehNQzqmA4iclM0gDVVlXraGZQvIyiA2nRY4ubJfysfH8jZ6AQmfsHsUXMyVN3L4JIc8h
         REm1sPvjNEemN7QJk2TwqHJGFcHu3moAaVcUu/7k6yl54DhsnP/N82X841n9xWpXCGhZ
         xTqtPaxfMGWJbm7l7YYhKaGCwKCioSJ4J0e2u+TeC9QSi4K+4Pj9IAmsR5r3ETM4WIif
         UkHA==
X-Forwarded-Encrypted: i=1; AJvYcCVm00iETvbpF5n1JgVf49dNcNQxsiQunIkwibW9SxZPAnpvxZ+GwEwjMgj9fmX6Ig5UO84WTHK84OeudICedAIfQw2B
X-Gm-Message-State: AOJu0Yz2cEL1rYgOFRwR4PDTriXvf8C/JwUi0m+2mzUbHQ+eTrqLBQpm
	60VzxuHCT+x5EYVGQLyybu3PFBlieIY1nj2Sor0LGWGjyi/aoQsD
X-Google-Smtp-Source: AGHT+IHv1tNiXT3io6sPJzRosQuTieU+aQQh3DhVuQ8G9xlQs/ngAmnpcybXA0XpKi0WXDHZJdcOAw==
X-Received: by 2002:a5d:654e:0:b0:365:f52f:cd44 with SMTP id ffacd0b85a97d-371946a8294mr7799148f8f.57.1724139885916;
        Tue, 20 Aug 2024 00:44:45 -0700 (PDT)
Received: from krzk-bin ([178.197.215.209])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-371898aad93sm12393607f8f.95.2024.08.20.00.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 00:44:45 -0700 (PDT)
Date: Tue, 20 Aug 2024 09:44:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	"open list:NXP PTN5150A CC LOGIC AND EXTCON DRIVER" <linux-kernel@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v3 1/1] dt-bindings: extcon: ptn5150: add child node port
Message-ID: <bcdtctvl6mukoccr6kq5acuztqmhbwhpscf37wjhlqwgjrk3yp@wyd3ivbfanhy>
References: <20240819185734.372469-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240819185734.372469-1-Frank.Li@nxp.com>

On Mon, Aug 19, 2024 at 02:57:34PM -0400, Frank Li wrote:
> Add child node 'port' to allow connect to usb controller to do role-switch
> if id pin of ptn5150 have not connected to chip's usb ID function pin.
> 

...

>  required:
>    - compatible
>    - interrupts
> @@ -58,5 +63,12 @@ examples:
>              interrupt-parent = <&msmgpio>;
>              interrupts = <78 IRQ_TYPE_LEVEL_HIGH>;
>              vbus-gpios = <&msmgpio 148 GPIO_ACTIVE_HIGH>;
> +
> +            port {
> +                    endpoint {

Indentation is mixed up here.

> +                        remote-endpoint = <&usb1_drd_sw>;
> +                 };
> +            };
> +

Drop blank line.

>          };
>      };
> -- 
> 2.34.1
> 
