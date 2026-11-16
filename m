Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794822685;
	b=IPSuU3xVNsRwHPM0A9E5vGjUpg/idbzafmhsrpmoj1iCj1JQzwAVRvGoYWpzG8gEWr9g
	 c5NbBLT+18PCafEclT8i0odD9C0I5AluPAwjNDTRqe1uvyljYwroFovhq4oQiWrv+cOoO
	 qZqLXWFfGycVuMS3Kbfs2nym+lbJ/CY9zmrdZXe+UYXLjIpclODvu3lgEkvUbVuc1I3wL
	 Ow4pR0p3fIxaha2badVb0yb6Km14gRNavkW6VEnFpzK3PCkUYDZlRNYMU0OFu0JnfoOx3
	 CGOS/V3k0hTndLHtVZO5QbKP7i3Q8+pRlxrwgiCbFhKVXElAivZPAjtT90ag+IPglGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=N+fImhJ1pc1ohPywlDOVCLfSXbIN+d12UyWza3WFBhk=;
	b=bxqapQINNj7iwTRYfGhgUbujioznhcjKOYVGjbhCsTAFp8wT8KvaZwz+TeWctViPB/PU
	 BTXOag4n6MraxPT+By1t3B4RsRhSGukRDnuQmA8Tep5KDW59h7QB1Pelqk+rg6jAHJIRC
	 BwKbrrBF2bvn83JuC2qoinuh55AShxTBSUj4CPOPXFMTcYQcyzP1HmkHTTKEcceP+oPAv
	 LJ8j0T3H5dOxOf8MF4Yojotz4I+mfp/ScGumq1xWoVIz6uQk0gM0XrgQ90YHxXoATZ5sP
	 ydGl1FmwZUKp58u1XG+sQID6TaRSfNbhRQQuINU0DK/Ci9Kch9p56umPVyAoQqK4WLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y6Pc+PIl;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0E9606A329
	for <imx@lists.linux.dev>; Mon, 16 Nov 2026 09:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D0E9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y6Pc+PIl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so1670794f8f.2
        for <imx@lists.linux.dev>; Mon, 16 Nov 2026 01:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794822684; x=1795427484; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N+fImhJ1pc1ohPywlDOVCLfSXbIN+d12UyWza3WFBhk=;
        b=Y6Pc+PIlOTpN1XWrsM1LtOUg1ExIKuUdK2jh7lm/i/VpohDHO/pCRamUyIhSn1M1PX
         EcI1Nkl1p7fGo4+XKDoIvBPPhNigilC5cBIDBIm+zLF5WXvQUxFuTKqnk+E4PIl9hQ9o
         ktRY8qyHEPQhDhWAWtfEcoM2dAMcWUuCsPdFuT8za3eiqIigo9L2RSNtfycD7GRUcP2O
         rjgG2bAWYGUMc6y3Zc9sEn/mQK2omoJnM2rMJXiYA3jmX8RR+yaIz2aMzBcUfRNk+FqP
         rV4UrG237JvqdxIowiqFC92sbgFifC0nvudD63SQpIqhd1aU9x9xYg72SalqMpydoW1N
         dDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794822684; x=1795427484;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N+fImhJ1pc1ohPywlDOVCLfSXbIN+d12UyWza3WFBhk=;
        b=a0kGqmch0IUWWQ5Zhwll983RhXo7lv+T0yZozlEFI+o7hJ3hbLNLGAhxUKhfYJLnDD
         O3ce6UrAUz+6p0xqCl+3jbdAWeck4GTgy8Ja5Co5idI5iNCxsfDJgncnAtzgECl9kSpw
         apOMrR5Llc7R1oFSMV5qPrUi0KcPychIT0GUGHmCWNa90o/07zir/RnP75Kxslw4S4gb
         +dv5uP4yLUT8a6mu3O9J35dQfIgkdj0zB9t5ZdbjFCfSDAjXF9vhCsHHB+Zwg6+L1TsY
         2lqKfhq3IOS1byQNzkYzZMZzckkqceqsNNILeDUGn80nYWnaZmuw9wBtuXRllRIoHbtx
         lSZw==
X-Forwarded-Encrypted: i=1; AL+hErE1m6QDTMUzE7QS0iB4aLPG/01UtTY0RmR6dsMFDn3MdW+FK1OG/bJlZ/JfXESj4RA5mOo=@lists.linux.dev
X-Gm-Message-State: APuU4Z+CANdjPKp7D6sfarHwrucYuy5B4cPpzdG9tnG6sIqLARa5uNrn
	KQ63haUT2f2GTp7hG3CO+IGFPDiNJX6mKaQ9gxMz/uhutpWtEnuPncGq
X-Gm-Gg: AZFdTZdmUfQN43Hr72J+LWFglZngBRgY4yRQ3zPQ7hFul8OnnBE8DJdR8H03xqAJhaN
	3rD6qsVjOAPoR2u1rw1BaVjmDpQZsKs7UoOBgtFLK9A8ss8QqoBsVk+Fa9lDZYqH4glAs+x/Hah
	j+3nlEQxDBIXihBk1BTYsn6iKiRcRqKdhZC23r9YsmICZA8i78jn8LfbRZj8X1MBbPOfyMrYc8P
	5X8Qvk6L7AXy0SQ1jc6tNXOMeiWyheduifbP1lOdvv4jjY+DlsgxNaMsCkyVoAWruMEVsvlg+DK
	AmDUTXvkBdJVHt2QGB5K+8l1FXOZg6RdaLLntsX/RDoGiSL/a/7qRB2Qee5AOLP2PSlsc+Rjt3c
	90aGGPK6LPgRGIacM69fxW/1EB4EHrcUqk6rKYehC6vBiWBDtxl6lC2fU1tMEFUsPvu++AY5t1t
	1JqrJ8sCYzVHx5YenOFR6sB0I4QS+pjB6/NtdTnTi8gJHhDDe3odvWqhxSMUgJTSIwv/CMKDUnH
	OS0ztD56/liCa3sGCzM2cbfM98wv5DrI136cDXN7gJlR8QyNrqQf3cTeEsj89VeJa3wfqQVd9G/
	tJ/EYaI=
X-Received: by 2002:a05:6000:2584:b0:49d:a36c:2d66 with SMTP id ffacd0b85a97d-49da38ab522mr16399232f8f.27.1794822683448;
        Mon, 16 Nov 2026 01:51:23 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72::cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c1968sm21517792f8f.10.2026.11.16.01.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:51:22 -0800 (PST)
Date: Mon, 16 Nov 2026 10:51:21 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] i2c: imx: test the block read flag of the message that
 is read
Message-ID: <avrSGehp4JX4aQ5L@eichest-laptop>
References: <20261113110501.1142036-1-mehmet.fide@gmail.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113110501.1142036-1-mehmet.fide@gmail.com>

Hi Mehmet,

On Fri, Nov 13, 2026 at 12:05:01PM +0100, Mehmet Fide wrote:
> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
> 
> i2c_imx_xfer_common() decides between the DMA and the interrupt driven
> read with I2C_M_RECV_LEN of the first message of the transfer instead of
> the message at hand. A block read of DMA_THRESHOLD bytes or more that
> follows another message is therefore done with DMA, which reads the
> initial length and does not look at the count byte.
> 
> Fixes: b460b15b3cc2 ("i2c: imx: separate atomic, dma and non-dma use case")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
> ---
> Reported by the Sashiko review of another i2c-imx patch:
> https://sashiko.dev/#/bug/linux-f62df5ed-ad96-43f2-872a-ae2c0100b73f
> 
> Tested on a Colibri VF50 (i2c0 with DMA) with a v6.12.117 kernel that
> carries the i2c-imx changes of v6.13 and later as backports; on this
> base compile tested only. An I2C_RDWR transfer of a one byte write
> followed by a read with I2C_M_RECV_LEN and an initial length of 16:
> without the patch 16 bytes are read and the count byte is taken as data,
> with it the count byte is evaluated (here -EPROTO, the device answers
> with 0x25).
> 
> The line is from v6.13, the patch applies to 6.18.y and 7.3.y.
> 
>  drivers/i2c/busses/i2c-imx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index ccf08cd63151..9abe0a26c877 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1713,7 +1713,7 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
>  			msgs[i].flags & I2C_M_DMA_SAFE &&
>  			!(msgs[i].flags & I2C_M_NOSTART);
>  		if (msgs[i].flags & I2C_M_RD) {
> -			int block_data = msgs->flags & I2C_M_RECV_LEN;
> +			int block_data = msgs[i].flags & I2C_M_RECV_LEN;
>  
>  			if (atomic)
>  				result = i2c_imx_atomic_read(i2c_imx, &msgs[i], is_lastmsg);
> 
> base-commit: 25e7ab89f4774b0f842cee0e8a20c11f755924d5
> -- 
> 2.56.0

Thanks a lot for the fix, it makes sense to me.

Reviewed-by: Stefan Eichenberger <eichest@gmail.com>
