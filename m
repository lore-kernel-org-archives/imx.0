Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99B357C9F
	for <imx@lists.linux.dev>; Mon, 14 Jul 2025 16:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752509721; cv=none; b=J4WPWiQ/4CKNNCIvFJsdhnOgbsB+dtorj0I66mlizG/QVkcoJMnsq3UeeR5cJFwB9bdLMEOVQ8QxlUOSjaZr6prfm3tEfVGu75V6fZb4onT2deKMuL/JGw/OmL8t+Gc+4JoMnTcAa7lEs77ChYE95OtlSIP2RCkYJYe/otYD0Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752509721; c=relaxed/simple;
	bh=IjBeInEqaR1AscqLvKgKjS4XTBwWEKh0ri2IaZtcn4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RLs+QgMWf6iCft2DBEDHvP8kUL4QlteWLuhw2ijo7nbDBYdwoZUFKo8mv05FXleN3JcNUfHGKumtAicCp7j8w0LP1XJ2TopNwpQ4kR/Otu4f0gdTb4gAqF/aTy+cEZ8ux4/Nxnef7KtV8EhlP3YzSbwePZUS7MvvxF8EuDr5yXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n3//mY+X; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n3//mY+X"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-454ac069223so28043345e9.1
        for <imx@lists.linux.dev>; Mon, 14 Jul 2025 09:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752509717; x=1753114517; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3uAikWubYwboCjSRWy3UuVNVoy2pKNWZlPhshgLVbQ4=;
        b=n3//mY+Xf2tarzX5uui4csIWDhRckm64HWqTTWQjUudGkSvmd5QKJZpej7m9/qaEqe
         YDfGlsAYv4Wqe4zQAnpEtrqtDPi1kPNdSlHy+eRNWLiLhFiBQ9eav2GHdNehL07Jif88
         THP5+eReRAcTWZfzxEpnAmS4cufESGBMKyx7xPBZJpNnDm156nq2oxncloIOFag7axZ8
         hqovW2DcqI7QHnI8y66iD89jYxKcr/Tcqc+wAqjkBSgBQcfxAKqy1hsZL0j8rue9Q/NX
         JiMVWbOKahMDMtDHqyg8a2AR3b6ZRFGzPyJLvQFwCtVSWHE1LqVGfpnIZ2+sgKV/+KZm
         6YBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752509717; x=1753114517;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3uAikWubYwboCjSRWy3UuVNVoy2pKNWZlPhshgLVbQ4=;
        b=ELGZukymlEzXxdIiA0xnA+g6At4+nwup49boNrN7qyt4SeLD+jrbwK1wu3dBB4aoCm
         UHRMY5hqgMxPPK81nkCStW+TKCAC6uByhwCpfzkMPZBKCmV+TwhTQN4TcAOpyMiRcpOY
         3mL+SEndn55+Pmob4wHbohE4IoLoWJOQC/+XYskbxudR8gUwRJrxAHj4PEYSyXxRX8DI
         AOPBJ2rQLks7EsS6ZTYZKjGIYirKh7F9w0D9ibR5q6pCMXSAnl9cxNwWTLrccmK7hTtL
         vfHSLhappUAd69JPIpG6i44QaX9V1cawaTp+a27Gb1KQlIdaWwxFN9vo6JybIKLueq1H
         UzPg==
X-Forwarded-Encrypted: i=1; AJvYcCWZ0YIxJVuh9BWEDAyN+RtCiacIdOZuBCjhqwB6ZyigZ3CyVicyIymLNvAZbJN6b0Fkb2Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YzkCdr9EUC+n4GsdrfUJIgRLq+EQFkgzLD+Nj9+q6Wrgecwo7rh
	rp3g5geHXEuFnBsETTqdJaIa3lqiPldAyG31as1MMhZtgX8cmkJApRIL5o7QffBrn+8=
X-Gm-Gg: ASbGnctVnjuk4BqknRlmOE/IEia60oJGYtrXfCU/6r9u/M36SD/Vsv0CD8i89Yftg4J
	pQusnPcsVhV6RZOEMnMUEsh1dMdScFM53U++iI6rrwI+6NBGoM4a7B7Bux6oQzHmzfzdS6xUc+z
	0syni/K5AsW3F39gB2tePwCq78V1HRafEJnOU/NgcbT2Md5kUB6g77TP9LSvH8un/9aea2RPDZW
	1iE6OLLDfTikB8zlhAJPa5MAYFFNc9QRdjh2uyu0rWPrhJAI0zao8Prg/tk3brFH8sQYaUBQ3NS
	ozGXl1QE3dPTUhJLIkZDm3tWHOCz5o5IE1TL2Gz1AbW1o7+tooxcCXIbw76eruLXZQQYhUT3ceE
	RBXP3fSjs1Ya4KsAa1TsDZPJ54CkcBZL/zOSSEOTVdMqxGBtncPRd3rqBJkds
X-Google-Smtp-Source: AGHT+IF8Q5A5IBRFKNtkBPYHjR2xPA0d69ZBpYOWGitAoZJklFlZt7awSNWbCXaAjhvDRCs5mvb/WQ==
X-Received: by 2002:a05:6000:2dc6:b0:3a3:64b9:773 with SMTP id ffacd0b85a97d-3b609526044mr126904f8f.10.1752509717039;
        Mon, 14 Jul 2025 09:15:17 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e0d5f5sm12914206f8f.56.2025.07.14.09.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 09:15:16 -0700 (PDT)
Date: Mon, 14 Jul 2025 18:15:14 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Animesh Agarwal <animeshagarwal28@gmail.com>,
	"open list:CLOCKSOURCE, CLOCKEVENT DRIVERS" <linux-kernel@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: timer: fsl,ftm-timer: use items for
 reg
Message-ID: <aHUtEgJxDst0il_4@mai.linaro.org>
References: <20250523141437.533643-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250523141437.533643-1-Frank.Li@nxp.com>

On Fri, May 23, 2025 at 10:14:37AM -0400, Frank Li wrote:
> The original txt binding doc is:
>   reg : Specifies base physical address and size of the register sets for
>         the clock event device and clock source device.
> 
> And existed dts provide two reg MMIO spaces. So change to use items to
> descript reg property.
> 
> Update examples.
> 
> Fixes: 8fc30d8f8e86 ("dt-bindings: timer: fsl,ftm-timer: Convert to dtschema")
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
