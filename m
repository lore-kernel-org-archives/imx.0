Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715B745FFD0
	for <imx@lists.linux.dev>; Thu,  3 Sep 2026 10:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788432316; cv=pass; b=E5AbNZbn0B6F11NGGHZNASl/iWujsy/bMsgY3xCnzaLcGEGF2uJWd8gUT7cHO2/B1GNduHgnq8cUsS5xslBWMlNhI+OcsKYlZ+DmAXtqAfDYoOE5HSWkRX+pBjwTYf0iRtZISLldzZC6mzhUVHoQMjxRIGZLNOZ+QH2d4PGn4M4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788432316; c=relaxed/simple;
	bh=MC3LKltk3JTVfZBBFyqVVxV3QzHvBo5VHIAP3AgGrfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tYAVvhJBWUC4LACRbSMPpkuHeBGCv8dKZVdyxXomDOy9EG0XNkK527cPzddI5Raj8zv/xoBd/uc/jXChAICxJEZoG8XWXGGMMQGPag8AtSR6+j9CAzdpyCkR9XYoylmdwYgwaVlbNWHsyKUiZrGh2GFAYdPlvXXtipKHC20aXCQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GlprLKGJ; arc=pass smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GlprLKGJ"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8518b3ff3e9so1943569b3a.2
        for <imx@lists.linux.dev>; Thu, 03 Sep 2026 03:45:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788432315; cv=none;
        d=google.com; s=arc-20260327;
        b=IanIO0Z6Iiz8bjOdUgUzBQlQQGMaKgQXxa5Vgs5lP9eVvG6EoNhDUzDqZgRjI645k6
         2TG+aPU//OV/9v+4lFHAuTLYIJZcCB81mROhGw8o3Ig2cEI332V06Jjh0nAY8nG798wD
         GSY3Dw0fdCT+az/Eusho9rTVkh5FWDKXtaVpiJtPphDK6muamp51N1KIByTCYpifemlC
         ppFJEQTlcW9OXzTwGOLfABM02rVGLGJ7nkvjnNQJ1IO3zSfrmdbjf44EmpArFzD3f2I6
         P/nH7UcJOz6RHYefswlr734Bzlyn9FAuC7mB+RlzLh1HOQkfLcVNVeHPfLP32aCXz2wc
         YOIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MC3LKltk3JTVfZBBFyqVVxV3QzHvBo5VHIAP3AgGrfA=;
        fh=IiON0/7pcuxSNOvZJ7QkBftwHfZR2vaVVHZpKf/mWHI=;
        b=ref2gYz1sMJc8eywd7+s7yWWuM4pYnBrFBKKqapegSy55WPgOCYUxjPnsdAeJhT8sc
         8QjjomS3yRpsXw1BkH6fAziXY0oSSWt15y9hHlz7BRLTSfEFVDDOONl8ts4zx/tMCkmM
         hxLYq+QW9m4PZp21bXp16rUMxGYNqmDiPqD9xhumVOr7oRUKSeeV4VRHthxFJX6od/dK
         v5y/+PL23e5iXj4MZNxzmxB6pPAUac8C/ffFCXcW7la+xEhqcy8KCSzbRc7X6hi+/yxV
         nCAOY96ojSqp4YTS0ZmLdsRr/eGBYahBWTR/M6QlfobVAWkwS9/1JHSAQW9zu0i0Ed7G
         1tCA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788432315; x=1789037115; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MC3LKltk3JTVfZBBFyqVVxV3QzHvBo5VHIAP3AgGrfA=;
        b=GlprLKGJf8mp6ACgCcREIBNl/YgVTtkaA17KQ7GEwIHHHxXwt4N0LNQgY3DKh1rYzQ
         ru2bHOAwy+iRXllWoqvIfEFuU/cdNnw0Hv1Wf4P7k3UlR7Aa/xLSTJH1BwONKeHRJt0H
         PNEc0EGImx1BqBejiyGEReAqfNL1VZj8pQ42hRZIKgE+2qFNL9yF14WvV2jZ0mgqJfy3
         1dc5CZ6pRIKAoyKKnRec4DQFqw9apcso2qhctRxZ1um52gslEMB2lH/crbQkGY78TanU
         Lh5Ww7S7uK8SHMYVUBGecYbrunmMHxukCQ7HkNKH+uq7fYKM31LWM4P3DnLtCAAa4QgZ
         mTpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788432315; x=1789037115;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MC3LKltk3JTVfZBBFyqVVxV3QzHvBo5VHIAP3AgGrfA=;
        b=bqeHWIkJA62N7P7ZU5QbyYz7ZmoAFdV4p0COSAJSg5GNhDlBUR/LhAANfs5Ow6p1bl
         T37GLD8Eudw4BXkZSvWW3VolvZ4jymgXNW+/skJZpuv2pGWPH6jS7T4IMa+rXjK1HgKs
         +Y+8vOL8EIfEBWfno+/L3N41VlCySdE3DY3+VjK7MJGvpoc4NfE8ZOS0j7uVZ9GRZm90
         2+2pkfxGNQgHiOmiSf/r77P2wcDHEW1HQ/jSYdOGHV3Z1NIPvKJijI6XDW3ZgiVFkvNk
         2bOgKoAZD6ItXZgYIIp0zn6ToUfuC1w2gbQHxk9i2EGvj0aVduIP02t2RwgE4wk21agR
         4Vgw==
X-Forwarded-Encrypted: i=1; AKwUvBzKE8hWhVBUclgLyYy7cz3+oUmz+RYrl+hV3DaClGd1kzRsdKJJGHy3swkjQe0b3v4KSJ4=@lists.linux.dev
X-Gm-Message-State: AFuF++niqg95AZbmeDKbMXZvQNSmZ7YsrWvdH/fTa/L/No6NZttlIwib
	IYAOnrOQetBdqaZVjygMg9zY7ZNYl/pPPVZ2yNZgc4bKjGWrSdgtW7hcns8Ehi82LYBZGcAW/xS
	IlCrg6FsbOhu9htzzBk/X2iXiVsVA3YY=
X-Gm-Gg: AYBFou3kCaEAKHtvEQHk63J0ASIy9iwMAaNTwD3aunoVuADVTFEKhMi/37ankPeqBGB
	fscgnHlr7VgV0yrrsIDwsy3BEKyUre5iD4ZMxEQhzaXVF0z46LI1VLPabtICLJWiCCrHN6fGZF2
	SlQJ/ZabJ3L+9om5iBUJ8Azb3tBGGmOpKbqqWDjdrX7oxtFDPBuyt93rR7jN+gXXohAEN4GucmU
	owtDaAztoWNK7tjn5xtFiu9hVprxVR8uLeW/DCYB4Dk/M1YvqHP9DFlQwkafJw+zfQufkIADr4a
	NA3lEbnb9IFA7iXf4mOd0sDjyEdwPtLaKkG5FxxmrhxC1jn2TGLOYp79S7EmM8rbZVcjb3JrSh1
	JRdel9mc4XAFEzpEWoq8Ka9ax8k68/NpnfWgWYaQWwMjjSe83xe9wdZcIAbfPaVVIxqw=
X-Received: by 2002:a05:6a00:409a:b0:84f:dfa8:57c5 with SMTP id
 d2e1a72fcca58-85ed398aec5mr16632746b3a.13.1788432314612; Thu, 03 Sep 2026
 03:45:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260903092430.354186-1-phucduc.bui@gmail.com> <GV2PR04MB117394049F412AAAC59FE93FE88B62@GV2PR04MB11739.eurprd04.prod.outlook.com>
In-Reply-To: <GV2PR04MB117394049F412AAAC59FE93FE88B62@GV2PR04MB11739.eurprd04.prod.outlook.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 3 Sep 2026 17:45:03 +0700
X-Gm-Features: AcwNN1WSJhqM0iZz0vmdxNeM9znHr1Ya_X824RjSXnv6-S-4Z4zMmbAJxEGwZ6Y
Message-ID: <CAABR9nFD1+GJiWdyxiuGVRzKjpCUfu3TQHYOLnOym3hHzOM2tg@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net: fec: Propagate PTP initialization errors
To: Wei Fang <wei.fang@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "davem@davemloft.net" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Richard Cochran <richardcochran@gmail.com>, Anson Huang <Anson.Huang@nxp.com>, 
	Stephen Boyd <swboyd@chromium.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Wei,

Thanks for the feedback.

> >
> > Fixes: b86bcb299092 ("net: fec_ptp: Use platform_get_irq_xxx_optional() to
> > avoid error message")
>
> If this is a bug fix, it should target to net tree rather than net-next.
>


On a previous (different) patch with a Fixes tag, I was advised to
target 'net-next' instead,
so I submitted this one to 'net-next' first to be safe.

If you think this fix for commit b86bcb299092 belongs in 'net', please
let me know and
I will resubmit it as a v2 targeting the 'net' tree.

Best regards,
Phuc
