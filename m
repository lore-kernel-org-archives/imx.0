Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AC12DA74C
	for <imx@lists.linux.dev>; Tue, 21 Apr 2026 20:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776802692; cv=none; b=m+QKUVWOOszflGj8nYR0nQeglMY3Fhcgp3LkqTLpqW9xDJisdp66xlxBlrVyIwz1oSpr2EcZ4EKZ3stX53+lPWwE+ecYxJjOclxQM3fxop/2MwY0WI6ptY3E3cITF/8K3IG83sq2glaoJP3EOi6BaT6K7jp/JMWZqrp9saPv7Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776802692; c=relaxed/simple;
	bh=RoJXJWqR3vOiO22NgQK5EsUI+vZUJE9QR22Bkld9VUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HondMP/TfUS9Sho/dXEwTjhskP7lwLWibaEafQAPwQfRByl4Vj5Pxl3cRvetVQVCeJrWKvbMEYU/TI6eEJVRXYD04eJrHHbKoc2pRW19CqOc9pqKyXuxfQ5JcUP3wn65XzLtaiQHfYVz/xRaOJRzmiWwIQF9R5KYeQ8FPk1E40M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=gsDWSX/C; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="gsDWSX/C"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8d7e7f48499so519064085a.1
        for <imx@lists.linux.dev>; Tue, 21 Apr 2026 13:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1776802690; x=1777407490; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v/S81oIdpD7a2iCCeuWx/EYZi/RB6XRyMOCJaXVxsWs=;
        b=gsDWSX/C3nJcuNR5VXPPupWaAAOY+W7e4GIi2cOOvKpuMh+JbyXImV2dTAI0gVJ8bM
         Sj66hQaiYDgGtAST+S23l6CiKZIf7FeXsHf+IG8TwaFLYExEas9gkJqmFXDK+8Mwllx9
         dfgYjLVoMd4D4Zald7hnOmiDR7ic+0RXKRhBfiTjnVtZl0u/n35hnljmkI6c0s53wDC8
         9au62EdMRWBo69XvjT7A5w5ETyfDi8JHJMroHLIVYRfvpgaJExFloSJt5X34mBikOoOR
         Iob2xHmYNkOp4EG58CoCWbXXds1NIWdoFSNWjgSMTtbx2554zRwPPcYEKnlaMyc0Iu8G
         10ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776802690; x=1777407490;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v/S81oIdpD7a2iCCeuWx/EYZi/RB6XRyMOCJaXVxsWs=;
        b=grUDUPLRuKyWXZjvujZipBqAJQlN3uu+ZQLVwq6gjpbD28/SVUH7ahaSCWz4pQMtNK
         gxa/n0PinGJe7Dc8xchyjpn19tuL2UX8k1KQoAGhIyYrAzhEAIoMZnWWVkXLR+3FJ+QX
         2uHpZ0wNAGSDE7MFLstUQ7xZlRe1HoskdaYWo1rgXg/J9/aJ2Gf0lJnD+1zToV7oItav
         V1Q3DzMWPihpo6iUhwHUVYlgz92z+AMZlNw5bb6MZrzAEYo5Kyu83FcA3E609f4nLT78
         oTMZ7Heya0FojPEEVKvTgcDVxOq5H6byLlXLO7e04M9cAww/gpjfA8leJn3f0Sttrgai
         F8MQ==
X-Forwarded-Encrypted: i=1; AFNElJ/oszB3Q1wyVRQbS9rvtKyrlvrByE2pCjEJ1kOrB7pw1PstruEk6oZJh/orhHlpXqJS9pM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxE7EaLhbJBeuptFQRHMq3E8M3FWxpjD6rlzhfv+S+Ug5V415i5
	K9BlfR1VSZY20YL64kWdn8FigBQYLZ34m7+VypjcYZO9/Ucy4On+V0Gk7TBC1+h53g==
X-Gm-Gg: AeBDieuegAhySB0eaKefLOomKzF24gH5xFMwXlAWbelmYkg372mzR/t9V1hYPmLr4ke
	MOjTivKZDB3TxovTF/TLodfDB5XA7o/m5P/XEzxotW4aONV0/KdMCoLD/Uiqpzg5/Xy85UbRdqA
	8JFXpvvEKFJOdbVCB+Qn4Soxl5gQlMz8Oaf3hlTXGKO0g/yfArM7qodzwi8MJ1eMYmNiEPBUtvP
	nfB4X3xegqbxv3GgHdCh61vWHGud/Z+VQmuDwiebajXChOU7i2NlU2NB2apdmBCFotbdyO5PIKz
	dKXMMbGkvsleQNY2Ec5TDvWAPOjcEMJycOlwEdM33ak9qbtuF9lXzoYhJmjVRO54f2PJOBIYQoP
	co+S+9JszYukPU8EQK0PGKhlC718V0RnIROto3wI5wlEbN3HVPALu4bdVrXaxOGT9hGvAwvZm3x
	6PR3HE19CmVva2sLcohhEFAANqQH9U/I/57Bc=
X-Received: by 2002:a05:620a:4441:b0:8cb:2b30:1c82 with SMTP id af79cd13be357-8e7918a3442mr2614484885a.36.1776802689816;
        Tue, 21 Apr 2026 13:18:09 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::5a82])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ed54eb91a0sm425852685a.47.2026.04.21.13.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 13:18:09 -0700 (PDT)
Date: Tue, 21 Apr 2026 16:18:07 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Cc: Xu Yang <xu.yang_2@nxp.com>, gregkh@linuxfoundation.org,
	khtsai@google.com, kexinsun@smail.nju.edu.cn, hhhuuu@google.com,
	kees@kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: gadget: udc: skip pullup() if already connected
Message-ID: <40ab2813-e583-484e-990b-1a3651e0bbb4@rowland.harvard.edu>
References: <20260421082050.1260823-1-xu.yang_2@nxp.com>
 <e431e2f9-ce24-491a-9447-1b872099ab25@rowland.harvard.edu>
 <87v7dkpc4b.fsf@miraculix.mork.no>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87v7dkpc4b.fsf@miraculix.mork.no>

On Tue, Apr 21, 2026 at 05:27:32PM +0200, Bjørn Mork wrote:
> Alan Stern <stern@rowland.harvard.edu> writes:
> 
> > This patch is wrong.  To see why, read the comments just below the end 
> > of the patch and see also usb_gadget_activate().
> 
> 
> Made me look...
> 
> Must say. This strikes me as a nice way to filter out humans from the
> rest of the submitters:
> 
>                 gadget->connected = true;
>                 goto out;
>         }
>  
>         ret = gadget->ops->pullup(gadget, 1);
>         if (!ret)
>                 gadget->connected = 1;
> 
> 
> The indecisiveness looks strange. There's a nice symmetry with
> usb_gadget_disconnect_locked() though:
> 
>                 gadget->connected = false;
>                 goto out;
>         }
>  
>         ret = gadget->ops->pullup(gadget, 0);
>         if (!ret)
>                 gadget->connected = 0;

Granted, it does look a little strange.  ->connected is actually a 1-bit 
bitfield, though, so treating it as a boolean instead of an integer is 
not completely beyond the bounds of reason.

> What surprised me most was that the different variants were added by the
> same commit
> ccdf138fe3e2 ("usb: gadget: add usb_gadget_activate/deactivate functions").

But this isn't what my rejection was complaining about.  The patch's 
problem was functional, not aesthetic.

Alan Stern
