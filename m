Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC5331A06F
	for <imx@lists.linux.dev>; Tue,  4 Nov 2025 18:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762282698; cv=none; b=iPU7IUPiH2tXErlw2aZKPZYkRb5565wX/MOxfgZvw9ALl+WVLx4/HFPgBT6y2JTvZGJrRzKx+2UN3b8IbEgy09yKryROv44nfZIN+C0UbxsgMdUK+dP/3qUAQ6m8xjMhl11PDwPNDdSMpe+CS5HFyZMO8loI9ks1tSkSUDuLurI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762282698; c=relaxed/simple;
	bh=sXJ6oo046UdvVw+WZY0s1bpUrcjoT8rdWb7NkoJ1tDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HoC5WpzFu9Vl4KhJn6jC4OIFYCjNviEc0KAw/x7slHpTAy6ZPStIffsl1r8lwrdY4BvTmlH6A/uORjqMaxC114WdcHzzVRGorj8qh+4KzorZH7ihuuhxNbR4uZAxl2f/JFyLN2JXOahCGK7wq9BAHPfkDvlR/N5FliPg331Eu7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U44dScwr; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U44dScwr"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-29555415c5fso45893405ad.1
        for <imx@lists.linux.dev>; Tue, 04 Nov 2025 10:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762282695; x=1762887495; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6B+aPmBbpdYFEZ5jj5U7gq6e1DRXMQ9PT8K+t5rVros=;
        b=U44dScwr7FhPl7wpLhoNJqYs4RNpFHw1f5Ieqdd7PahudBtJSNAAckWGG/DL79XdEw
         WkFlaJ8UiRp6SLZtzuYjyHJ4xXMVdFb8/JBdCKhiclAovVcCz1VcKttjB61HAdGwFRyZ
         SzCsFCVTxmSeYAd4sIzKmQCaJD/6eYTtkHF/VBWUbqivLrekBjJ8bHcH2SPB/to7Bkom
         U+s9xvGghTBgP6tmQxuE97cZKKl7redJ9LwbaysLSl5DNMos2Vw5U6HfnWGls8WCHExd
         JWrPc5CNMJcSHOglZreWV0eJjyBB1dNbLJp1dB/wPFGvFZq5k3VAZaWb5JD7bOPd/FrR
         ScCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762282695; x=1762887495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6B+aPmBbpdYFEZ5jj5U7gq6e1DRXMQ9PT8K+t5rVros=;
        b=b8GsDhgKLKdVHigaTN9628McT9IArZDfxXdfcUEgmK1EUhz9aQ18EXbDumQ600EDXW
         N0+/qbZHJTrEnbRrMluDQ0UyTiqhMuneO/h2VHLQeFNzslZOOF2+7h9i4OxWWoTFHuiv
         E8zG9P8aPqFOYg2w9CHQBya1EHSwSNeuY6TOYrLsp0XBfW8MMk12JNeninkz95WzvB6p
         yaEaRNJxtWJZKgC8+UmWuahEzyYCmsVyhPpas9fgolBBdG8kV42aLoOqYOIlvukqX9Q2
         eUxvAC2Jtq31iId1WsaihrXn2I8NqvWdHXzIgO68M4vkFwoZQBRPgj2/ei+mQZGjeWPj
         0Rdg==
X-Forwarded-Encrypted: i=1; AJvYcCXZlbEhCH5etpZy99SYrBM7Q0+bKFLHzDJPhJs14EzDUFHKtRvOoiHWDvwdSRDVZCIB5Xw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwM0n4oK1/8IEcXqP32Ov81O6yhd85/TMLwdyhF6cqnT0YGR/mP
	Q3jdHN8jZaknbQxGSTdnZUR7f5j8gDW1MnLKXBpI6RA7kE2DiDuO/kht
X-Gm-Gg: ASbGnctpsIR3ruY5oxH0omodQChx6of8o17NmLjmgXgruKl0G4Bg3qUD04M3TCEL7Hr
	wWDy1FbnlVs7+wBjuenJLVtUOWpU3LcQoJa0a3ascXbfg7CtvwaZNzYmI7cjG+49X6NyW/Z5fek
	UVjpUmbQbX/Nzb195hlHc/IVVLFE91Do7zY6vv34wIahAeQFLIt6nC7Xvc8vjjMvQ93bxZ8g0NX
	r86mjWm8Bao6SvyXunEHVUPijXhGvJIHJTNtQN/Dj6vAjio8fYWgl+I1FuRBQvS6BnbbdBiEN5K
	X8fzDu4BD6eqo62Q0JsXg+ECx8+BWylzUFT09CZdWknS0qy4Z+UTef5Td/miwfRXO8u/NNwP8V5
	AY1eRYxCGavAQmJASr6OTG71DUVjGHY07t8SyczqJv3ghUFwvIqoH4S54dyQSXHUXnvHHKDgMPE
	uT1UphOLEGHhuRRuSiryPkhx4LtiSJmS8HRygeHin26A==
X-Google-Smtp-Source: AGHT+IFHo1RV7muJZAmmalRPgMc0IPBuau1lfoRTnOMDYdIJrPmtkFZaswgqqRuY7j3qYZj5YpoDdg==
X-Received: by 2002:a17:902:d482:b0:295:425a:350e with SMTP id d9443c01a7336-2962ad0c176mr6981645ad.8.1762282694755;
        Tue, 04 Nov 2025 10:58:14 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:1f2a:f7de:951a:621a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601998d4fsm35273745ad.43.2025.11.04.10.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:58:14 -0800 (PST)
Date: Tue, 4 Nov 2025 10:58:11 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Anson Huang <Anson.Huang@nxp.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Input: imx_sc_key - Fix memory corruption on unload
Message-ID: <uimkyxzdrcrcm6jmprcsnbl7pw6w3impm5dqam5q4gln3lrcwi@ngqtd5pbuywo>
References: <aQYKR75r2VMFJutT@stanley.mountain>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQYKR75r2VMFJutT@stanley.mountain>

On Sat, Nov 01, 2025 at 04:25:27PM +0300, Dan Carpenter wrote:
> This is supposed to be "priv" but we accidentally pass "&priv" which is
> an address in the stack and so it will lead to memory corruption when
> the imx_sc_key_action() function is called.  Remove the &.
> 
> Fixes: 768062fd1284 ("Input: imx_sc_key - use devm_add_action_or_reset() to handle all cleanups")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied, thank you.

-- 
Dmitry
