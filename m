Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498DF288C96
	for <imx@lists.linux.dev>; Fri, 31 Jul 2026 13:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785506047; cv=none; b=f2HKbWGvth8k8s6SLcpgwyegs4MmCcBnnt4AsKwcPs55rJugoJ3dr6GiudBz1nx5Bu5DyXir/E9i/qamVE+AexDuXf0uMepfFffRb+VK3cvBN+vc4zT7s6H8s0TQvDEalfUPsfo3ud+jsDRX1cmjt6ELSv0zg1ce/IR/8G2d7i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785506047; c=relaxed/simple;
	bh=XnSPYg57DRaO+9NQhcdSDefLNSu6VNnPlnWcrN68V94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X0PY2VcPgHMjvqkW+JE2n9h19Q7EedXh8DgbQ9HkONWKi/F8sHfp2u9QIBmaE5Krgze0mrBL7dArnFUxEeg6EKFhWdG7vFMtX5K6/OrNNdbtyU/6ZaVMcWF9FxsiCYO+mQQISCEIyCFIlhb3KwcDYtzImK/XZD6LNEUGUDR3qLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJqce+Ea; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJqce+Ea"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c197eaaab00so160113066b.0
        for <imx@lists.linux.dev>; Fri, 31 Jul 2026 06:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785506044; x=1786110844; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q07s+fTeCEbc39agdRyb/qs2zGQJBvKVPPRteZKniHY=;
        b=QJqce+EaoEtAdzpS7ya4bh4RwHetDFKm4ZhCkD3KOn9aMhXsVB3Wl/rkP6c0gwGa5p
         rOxh0mApi7uRL8zVC19bDpiyXPJICmzHQNzPzJh8MBXhJv3HR+2KqXZI920jJGoGRT69
         wJLsuHxVcjO4cWGn+n7ENUYRFJsOoDIHZfPWqDMgCcJm6eaBTth9sfBDUs25fCKg355q
         ub5BVSwEzJ5krlf7n/Mp7cQSMTdnFrcqHwo0yFs8Pk9DGKyA4Fh5zalZNWvkiPRg6u7A
         q4Nkz4NGxL+zzDI8ozO9vgWCcdqDWFqgAw/vwo2rHj5zEN+4ERmwvycc6gQCzfo+TNag
         U2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785506044; x=1786110844;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q07s+fTeCEbc39agdRyb/qs2zGQJBvKVPPRteZKniHY=;
        b=AjLOVybJycqroJ65i/WLw/ZUAhBsPbVeIR2LOyaRnXwAhYoVtC6LjVl10jO87jqpOe
         ZxCSZM6BfS6lIi8VKAp4iFr5eGFkYALuCNi9DaJjTcvS+RI+1/gcsyPW5OnsEyMqnHAR
         EKmRUYkV7VlHdUuDn8SZjnZpQr4sYxsTRy7Ih1bKAk9Wp8YwBGRnXq6P9xSRk+t8DPVw
         9f9OrWM6lZ92nx5teqmL3pi0cfVykvLB+vhiMIcI37L0P0uhR2IgH6/sMLD6aePJu3O0
         mw+Jxp60E1qN3UGLTHPD0EU5U5FaVL3cJphabE5n4GnwW26iCTKF8XzisYkchGFZMpMy
         +6VQ==
X-Forwarded-Encrypted: i=1; AHgh+RoXFxJgVzbOn6523jWfsu1XvbedMWqUyo+7/XJiYmDrcyiYid6AtZltrdOdOTfLsLCuKuE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwtuizC03ep2CuywsDhauiSKkMLl3Q7LWyBokTl3oZTuCF4MK8N
	adHH90uLQmW0ZDK8Pd/pYvwGFgHbG9CPKVXhsZDftsBfEV97QaEgtmjs
X-Gm-Gg: AR+sD10L1cWirDve+pN0G+Hx1smibfOFQvIZObxURy5LSy9qytmJ6gUDYYOlNfxYy8b
	a/5qs5MmuZfv99r0UJKNEVfgOnGfKYBz5YMwdednch88t0AX0Y9mmwe1aIa8oWyjEzfLAw8wUIK
	SBpwojjns7JA3oxYhE8fgjFmJ4H35akv7MMb676lDpZdZ8jg+ZSKQ5MAOTAjSZ/8K9UE7aLaqlM
	ZjLNscmt/82MRKhim5HIGMT89OTwXxP0EiXiE0RweC6YnGR9S30CqGACGOcKqMnqfEcywmrawl4
	UwXlo+3km6995gOScW4mZkQdEopM8b8UY89bney3Tp1d/7UBoZQWSVly4Ou3Nwm4HimcxgwCCzT
	0gPNJSNstsU/Q6Z1zGlQX3VEdtkClGz+P7qfYyEOWCI87WOL1ovzBfkgvQq2I48NxKMOLhc4VmM
	4+WMNO74JPydetbQtekviuGkdUda8psvWGCE2Yk1i5kf6NRuMkRhupjWeBAvUelT4nznY8YbtKK
	QjCrzrZXW8oUSqgEDEIuZviEoF1Eu7A6cGFrdPd54WFT4sT07Yn0JN6fIW9DrTJVhVqxV25mCk0
	Qi1L1wwT1hEGn6gcWIBI32+KpfzOzq3xnEd5tTAifwa1LDzV7RzJOnhvml0axymEEK1j20Y=
X-Received: by 2002:a17:906:7945:b0:c19:fb6e:5fec with SMTP id a640c23a62f3a-c1fd23ccb41mr126779466b.18.1785506044262;
        Fri, 31 Jul 2026 06:54:04 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a8d0-bc01-6d31-3d12-3a11-d2d0.310.pool.telefonica.de. [2a02:3100:a8d0:bc01:6d31:3d12:3a11:d2d0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd3ca3b53sm165306966b.24.2026.07.31.06.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 06:54:03 -0700 (PDT)
Date: Fri, 31 Jul 2026 15:54:02 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2 4/4] serial: imx: serialize imx_uart_ports[] lifetime
Message-ID: <amynpoQscIXD0fu8@gmail.com>
References: <20260719221014.44354-1-kmehltretter@gmail.com>
 <20260719221014.44354-5-kmehltretter@gmail.com>
 <2026073011-crock-utmost-6392@gregkh>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026073011-crock-utmost-6392@gregkh>

On Thu, Jul 30, 2026 at 04:31:51PM +0100, Greg Kroah-Hartman wrote:
> >  
> > +	mutex_lock(&imx_uart_ports_lock);
> 
> guard()?
> 

I'll use guards for v3.

> > +	unsigned int line = sport->port.line;
> 
> Why are you reading this outside of the lock?
> 

Good question. The local variable is unnecessary. I'll remove it.

Thanks,
Karl
