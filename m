Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC39224291B
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 02:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755830697; cv=none; b=F6RL0zo8lmiHOmp78I/Z1dVrx3eMBQjswwexpoRbagVP4hZSAWDwfjAZ8o9lOv9LBTaKvnzy/bf4Hmq/DnfbynX0K7pTGJpJg++cRhh+nMVVOGd0UyYeaCg3m3BxQFAhJOLVXbpB7Qn+yfSvnkNgCofLr57JlqckqTDefOBOr0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755830697; c=relaxed/simple;
	bh=ymmCrP+/+P+LpNntOeSJe6zYTkGwo1FDY5h+FuIYRoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l5C56BU4qu+ogOOE7ogWL0RoclZtzQoFr+YjjjsDA49KJqumcjoZZIJgjMhymjb/mB+bcCFSug75pxZsU5SX3QTYigMsxiLh/wB1GusXJ6HDEKLI+PaN+111uwLp5Vbkr1VB5nNnHve9fqPepmOPeUXeyqzAKBZpLLlHc0GWaiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kt6RXBjw; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kt6RXBjw"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so1632175b3a.1
        for <imx@lists.linux.dev>; Thu, 21 Aug 2025 19:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755830695; x=1756435495; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uHOsZL5h3AOX8Ev+qfsTMnxg8y5sgs76/JGMQGQVcN8=;
        b=Kt6RXBjw8KCExKwdXxh9Um8z7rymACmUck/h952uIGfNjEZkDuxnRr5jDYJ5/4xhi2
         zGN4J8hqlUE+kEM5tCkivAVqTzE7KpI1lBKVZ6vQgFkoytGvZU3mgzP8p2pq6XgAONXC
         qAly6SNHcJT5FFfdRTP1PCAQ3URlNr99cZwDSfhlSSecNkrXfTvSQRm5q+8gyVAcQX6O
         z0W8z38lPse8+a4qvfY/9IYcA0Zk4usydnM8BZrGOi0ZRMNWn7/mlW08bHFiRIg5wno4
         +ioCMiK9LBqPzpMmgxJ3fW3hB3lWALwkTqalrC9EMdvxoLNIpzGmCpkVj2Pq9qAhB82y
         7o3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755830695; x=1756435495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHOsZL5h3AOX8Ev+qfsTMnxg8y5sgs76/JGMQGQVcN8=;
        b=myMSaqIzQv7h/XUR335u1kycuPTaIFpfvozr7iSCNGnjZ0GeKDpzNmYcBJAvcewzLZ
         waA2n9B3m3JylXsjHhndoBK2qsJrftlw44OPdrdR6mVvS9XHL8k++Iek0x91XqbNmS/u
         vLkugFlbWIUJuX9RmBIny6E8j5TOCAnHYOWB6ODe+XvBP1xLjXzTK+GIOBZs1zzewwS9
         qwjrF69pXZUOH2mf0eXZNMzKPWo8fNz2vutiuWgrRAzDwv7R0g4RLf4ADCPE/bbzBsdr
         ALzpI0sIbRVBrYqHLM66E3IVYaY7ESdCuIZ0hF0c19Q2ll1Pd30r7pTTC66x6Kr6Zx8P
         i0CQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2u4RYyUBs4/7OK3kKsdgoMs8Bf5o3gGYgAQMv9BkKDb0o04QahxkQ4bPWIolreRVw1vA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxxc/8F/SJmIqE+uK4rskNWxS8V2+GPVBJ7+Il08uT6eQcgDsH7
	wf43JmPKm8DnqLg5FGKnxfwrAcPiefgpFIHYpOAFfGd4FwnaZDqz/vcP
X-Gm-Gg: ASbGnct5P9Hy7SE40xnziLhYZtRplPeib6DKvJClRMpM4gnpdj9IVkaXaNTVlhiRL/L
	odV27klnOI2GBnbTGI6UrABWC9hdJUKy6SfTsfUejqttFHqr729prCHbIpoEfAZnWwqcgGD2Py3
	g1AdunCnnEsVB+Fmk/1It6VzV6WlkIdN8GYuuCaSz2jJcEQ1wbCfaAU8Izw0jjWvAihH/R6s4Qd
	RsOOBIMSu+xeYIRgOSKCSN9tKqLm0Ievha/nMstf6f8IbVHnRQ4ru7VGSakCIO8O6eB5AjR6hlq
	TmdUvTDZmzum+e/Nlx0sfDrFGD/C65HaRYmusBLWDzex1Qn/GZZCOkrNEDEar9nJWIOJ25+acl2
	G6fFI12URxkFYvnahF3gK7StGcGANkeQb
X-Google-Smtp-Source: AGHT+IG/bG+rHH6H4KxhjjaxQycZZAweGpYfTMuCllHKApJ6KI6vKWQZMMacqTWR/3qipm3upk4BaQ==
X-Received: by 2002:a05:6a20:2450:b0:243:78a:82d2 with SMTP id adf61e73a8af0-24340e2aeddmr1948063637.31.1755830694893;
        Thu, 21 Aug 2025 19:44:54 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:9cb2:179:b04b:be48])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77033785903sm262094b3a.66.2025.08.21.19.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 19:44:54 -0700 (PDT)
Date: Thu, 21 Aug 2025 19:44:51 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/LPC32XX SOC SUPPORT" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [RESEND v2 1/1] dt-bindings: input: convert lpc32xx-key.txt to
 yaml format
Message-ID: <x43o5o4pcmhoudaeoklzanvivvwgytyrubvfwjfigcplaizgzm@ll5mq3nzsgnb>
References: <20250818183814.3603308-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818183814.3603308-1-Frank.Li@nxp.com>

On Mon, Aug 18, 2025 at 02:38:13PM -0400, Frank Li wrote:
> Convert lpc32xx-key.txt to yaml format.
> 
> Additional changes:
> - set maximum of key-row(column) to 4.
> - add ref to matrix-keymap.yaml.
> 
> Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thank you.

-- 
Dmitry
