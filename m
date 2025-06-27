Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1732D8DAF
	for <imx@lists.linux.dev>; Fri, 27 Jun 2025 14:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034539; cv=none; b=hbarhH60kc8zVR85C2AkL3DIzjTQf5cHj3k0iTPMIbqt92wEE11ooMh/49UGEQUWkX5MgWd2Jb2utfHYsnfby0qcz4CYkuLaeXFybfqYRrNmCIu8PbydVO+tf68GGh2cVP+Q8FQEMyLUmyvJWPyZDLVwpI0fik11y1eYAWbGI9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034539; c=relaxed/simple;
	bh=KpatdQizjtFhLtep6XDpgDVmkA3+kxWZBf7goof4Im8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S9+UsvjfFXp8FwA+usQ82AiU2wEECWAE4EIvkDuCufPyvgXC/cu7EMPHHgnsT6RsKnId4qQrDrkUqmKcVl3tNsjXV46PNzr+WoObVLsdW38Y2D+uC0kK/XFMS3ouZqQBsyF6qy16BQW6fr3hv18vnLOZhMxK29RoR6AC5xSvH5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=QqeEcX7M; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="QqeEcX7M"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6fd0a7d3949so32492096d6.0
        for <imx@lists.linux.dev>; Fri, 27 Jun 2025 07:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751034535; x=1751639335; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C770HeWnbg8TH5iYglRt3200XdihOLprXIOYlhNWMgc=;
        b=QqeEcX7M2oBcJf+UqdplftOYkPsW52aQ3chSxsANDA4J2i5LCIMHiwiLY2a6Fj2d9i
         oSzH11+r96VxqNQRwmXe7P7aoT+12IHUwoYixOrw8huJageKh36pnhilsdXKjUGNVpLM
         +JOM1S1CLySXt3zqOSxCTd+hMixMJkWU30S/gSsJOIy9JuB63GOvsZPe5dbQ3+2Dc8C6
         lYp/UwoA35IRgPp4kC3+C8Q4xEZeTN9HEsuL3Ul66NuMiTgTJWdl1+nLEnJMR5s/sK8y
         2n1oXMvAk9nJ8nzu4JgDlWhwP3+cafuayhEeaOMPdpyT6l/fbV0AMpXklTeIYukDznMj
         CRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034535; x=1751639335;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C770HeWnbg8TH5iYglRt3200XdihOLprXIOYlhNWMgc=;
        b=Ie3JQuzqTk1ntyeMXv4DR0yzuBuL1Ak2u3wca8upJwY4EuDq3CGHkI5aZ4OEcW9JA8
         SQgi85ThTJqkhd53jNIMn5Y68LPahVpYMziyj4eKsx7Irgs3wE4tenw9ZzVil2LYTz35
         mKktAuY1jDkDq40v9tHGZeMX6+ES1cyO1lP5J2i1fMLyMAtAnTBRNT3wUvSqyRagHwSv
         vB25oiLqLuZs6JKhQ2KRAMt3zkYuoguYUABA/AMk1Nqb1hWWyLLgt33GkG0RhadmqDrX
         7f9VSbaBZAnDag1cKg8LjD9eFsX+ok8agxVfMQ/08s8PS5ZDREOV2rjyFajCRGT1pQWO
         bggA==
X-Forwarded-Encrypted: i=1; AJvYcCXRW1k0A8fNKnsEtXFRY2FNIoiPvliXCNYWOYaSJ17vSitWBaY609vX7S0U2p4oW+dIUPA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzyuaP3V/2YhHV0jgxRHQ2Yc4TNKaZ1hE7zWcOFhNhK6LfoCiaK
	Kh4qeQRhCdcOxntRm8FifvWDbZitfu14EY94r78FRX0ULfeYHXlLi6ee+PGOHKmLow==
X-Gm-Gg: ASbGncthLTbkvt5TEJjMImdTBY2lSPZyo7Tlp3SnWggLseK0/6k7Io9nqbZkLcSncDQ
	iZkThykeHxkbEaEAdHNUWYetRRfi2+iqn3V2JnpUWpCqJq2FETndJp+d86+2bvnEmLvHAm6+cC+
	GIsaX7DD4/MSNHZQbIlyXq2ZS+L5XHTt+oUDlm/1qJ+3rXgl/1GAfJSnqrQxI5b/7L2JvWyLcNE
	+Z8jmkkquxzuCes/aMa4SbyDNEq24HqE6N7LnuNzTCbLKMWYv3vgoAuHHZjRpVS7ewqbsz5XNVw
	zbg1yc8aFwwDgFGrD+GrorcaFTA3tt6/GEqpTj1vOjSTpgIWZk8ODJ/LJxN853uihoS78Mksz94
	aHHV0
X-Google-Smtp-Source: AGHT+IEEz4pxaZd2p26Wd0rHmX3QxRvSCJOIV13uXvr66DRvtIABRuX0xyFBcsiRJ4IyA8rPeXFOdw==
X-Received: by 2002:a05:6214:5784:b0:6fa:cc39:95 with SMTP id 6a1803df08f44-6fffdcfe051mr54002316d6.11.1751034535284;
        Fri, 27 Jun 2025 07:28:55 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd7730ac96sm21006076d6.105.2025.06.27.07.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:28:54 -0700 (PDT)
Date: Fri, 27 Jun 2025 10:28:53 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, viro@zeniv.linux.org.uk,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: mon_text: find valid buffer offset for iso transfer
Message-ID: <8a251c8b-5ec6-4238-bdcd-8d8001fd06df@rowland.harvard.edu>
References: <20250627105651.3653231-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627105651.3653231-1-xu.yang_2@nxp.com>

On Fri, Jun 27, 2025 at 06:56:51PM +0800, Xu Yang wrote:
> The valid data doesn't always begin at the buffer head in case
> iso_frame_desc is larger than 1. Otherwise, the output info will be
> meaningless.

Not so.  usbmon intentionally copies the entire isochronous transfer 
buffer, even if only part of it was used for the actual transfer.

> This will find the valid iso transfer frame and return correct start
> address offset of buffer.

Even if this were the right thing to do, how come you didn't make a 
similar modification to mon_bin.c?

> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/mon/mon_text.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/mon/mon_text.c b/drivers/usb/mon/mon_text.c
> index 68b9b2b41189..4929c7f5abd0 100644
> --- a/drivers/usb/mon/mon_text.c
> +++ b/drivers/usb/mon/mon_text.c
> @@ -145,6 +145,8 @@ static inline char mon_text_get_setup(struct mon_event_text *ep,
>  static inline char mon_text_get_data(struct mon_event_text *ep, struct urb *urb,
>      int len, char ev_type, struct mon_bus *mbus)
>  {
> +	struct usb_iso_packet_descriptor *isoc_desc;
> +	int i, offset = 0;
>  	void *src;
>  
>  	if (len <= 0)
> @@ -160,8 +162,16 @@ static inline char mon_text_get_data(struct mon_event_text *ep, struct urb *urb,
>  			return '>';
>  	}
>  
> +	if (usb_pipeisoc(urb->pipe)) {
> +		isoc_desc = urb->iso_frame_desc;
> +		for (i = 0; i < urb->number_of_packets &&
> +		     !isoc_desc[i].actual_length; i++)
> +			continue;
> +		offset = isoc_desc[i].offset;
> +	}
> +
>  	if (urb->num_sgs == 0) {
> -		src = urb->transfer_buffer;
> +		src = urb->transfer_buffer + offset;
>  		if (src == NULL)
>  			return 'Z';	/* '0' would be not as pretty. */
>  	} else {

And how come you didn't modify this branch of the "if"?

Alan Stern
