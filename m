Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A232D6E5B
	for <imx@lists.linux.dev>; Thu, 18 Sep 2025 05:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758175112; cv=none; b=P+IWrd6DGO+BF3DWzor5fQ2WYAV1IKYRVvFSVoyt6WzLI4h/jy4VjE42nsX9ah0k9A6YQPV8LLOVDHAba3rMwRsqf2fzcrvThX50MIpk/Bd/O1WyObvF3TmKuw6ecP1lBsiDqQ8qYwPcpWF06bncV83UKltArNhzIldRQwT/QIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758175112; c=relaxed/simple;
	bh=e7yRxA2B68UWIKkdczYYijQsT9ZC4h4tFwI2brifv3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NyK15P4CIt2hC1kV2dK+u0A3bHOofC5B5QWc73GdnuIGDbXufOIsaMNmfLDQCG60IK630VoBy97t+SaLSXCBjrUcZyhCWp1dBuAIJJ9/FG4XFz30+0bZtAf/edCsgTBlWexpwZjfEL4YHJD8dJXTmKLiN0YDVsTWAnyrmUxINwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nBTU0bHb; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nBTU0bHb"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-77287fb79d3so594165b3a.1
        for <imx@lists.linux.dev>; Wed, 17 Sep 2025 22:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758175110; x=1758779910; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1M8K/x0sWMdi+p7zlur7P/Abek/ld1zdxtrufjSounw=;
        b=nBTU0bHb5sKsASP+HrVotBmrLLaCfEwAuIWqPXI5thennrs7GelsaNVTjsRWljkufi
         hoyhPKPTq0NPU+o374tH/o1aCd9uitPtChs53LpwWLY1ACQaw8wT0MawVJrfKibE4WIm
         8R/Rfh1w+CGrgezcLA190RKYr03s/VpR5TA0od8pPBIMuzrd8Z6oSYbKoNBKitMGw/8+
         6L+vvzkyfFkumo1kU2hQg/yJU6KyvcDVEKyxrHIfACfvIP5fF2n7xR/Q3X9G28lmyfvY
         v8XHOLSxkaX9YKS1jWRXnAW0ks1/1V+dXjUVUT6qO1vNEp+hFdNx1sA/t4Z84cgrcXQ8
         5DXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758175110; x=1758779910;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1M8K/x0sWMdi+p7zlur7P/Abek/ld1zdxtrufjSounw=;
        b=QLwZ48oeZwCQ16FBCN0nlIi5oQA6lacPHL8YObUy/wIWhWv8fkFpXCgCe+uwXTdfPj
         +Jnilx1PXlL89Ponn5SHZEekh4HeT+8OsBu1UmQUnUuzkAtJ2JkVS8WkgFdLy3pXxNmm
         0KJSTXXnAZl7LcmTqSC7bQbuuVZ+xJEl3ag/tQNt03YHro9ijVwFP0sS62RYub3531W1
         LBcJ/s8AFVavRCoYWrvEeSPtDSsZ1hAi5sQG51zPukzscw4RtGwAADFhderPrtTDzH7P
         gvDOTm0RQrsAOTk8j8DhuS9knZtt2LRuED96K+840fhd0dRGhTx1/VrIbqMHPHGQ+NpU
         PPrA==
X-Forwarded-Encrypted: i=1; AJvYcCVXeZped83bmkzTB62jLK3jVDjCLIRip70Rfmoy1JUKXeSvK7IXJHG5mK3xdeavr7zcjfs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxBG5lT1tSRHUh7X6wq7SY9Jy6BU2wTv/1ikktyzpLd3qzrn5f7
	Ol48SUSQyGECZ7CDee8QY5h+2fVRdEJiDukHRch8B7qCR/1VJO9EiDF3
X-Gm-Gg: ASbGncukcDDAYUX8LXImc/QRBhjcTMgEi3v6ix9lCekYXg5lJmyRSy76ZxuKlAREMmb
	KbwpXXTajH0f2x18GnrrlhqPK9X+o6q6sHyZlRw49LLTTX4uzB8P4Bj++5qHOtNTBwsg6e/YYiE
	pzvmg0F9mQEaR6MEFraLaeBWIuU6HMsX++VD01KygN5qdnDA/xpt3CdeOk5J9+EW32RwkauYisu
	ZzOmoza7ChQPRyD5745YpKwNPbta2mVGfQ1pNhSYY0gJuStcpX7MZR69rpI5wMu0PX+9gOTkF8c
	GDt7PUcZPPd6E5Sioo1Jbs3LaRt+jvOgdJAD8jA7maHow1uZa7/bRejqg2aBShGEl2HyQ3CbCYo
	EjE7Rnonfvz0usZhSoS/p3NOYM7EzCQCSdRQtaunV8Q==
X-Google-Smtp-Source: AGHT+IGb+rdTMfwVbcT/i/JK1WiLKpQvT7aq4HHFKHQrPydPEVY0k2OXSVn7CE/ZKWO3IERNaHMXMw==
X-Received: by 2002:a05:6a20:748c:b0:271:cdbb:4d26 with SMTP id adf61e73a8af0-27aac3da5a9mr6725643637.58.1758175110263;
        Wed, 17 Sep 2025 22:58:30 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:194b:8358:5c91:3d3d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff4002edsm1199838a12.33.2025.09.17.22.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 22:58:29 -0700 (PDT)
Date: Wed, 17 Sep 2025 22:58:27 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Oleksij Rempel <o.rempel@pengutronix.de>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: touchscreen: resistive-adc-touch:
 change to unevaluatedProperties
Message-ID: <wbwtlcrlwnvvjyv7cnffu3sltrqfaddjf5f6dzizhgglwskjgb@zgxjfm5oafxz>
References: <20250910224402.994046-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910224402.994046-1-Frank.Li@nxp.com>

On Wed, Sep 10, 2025 at 06:44:01PM -0400, Frank Li wrote:
> Change additionalProperties to unevaluatedProperties because it refs to
> touchscreen.yaml.
> 
> Fix below CHECK_DTBS warnings:
> arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt6.dtb: touchscreen (resistive-adc-touch): 'touchscreen-y-plate-ohms' does not match any of the regexes: '^pinctrl-[0-9]+$'
> 	from schema $id: http://devicetree.org/schemas/input/touchscreen/resistive-adc-touch.yaml#
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thank you.

-- 
Dmitry
