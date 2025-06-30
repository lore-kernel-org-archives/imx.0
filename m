Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C6928C5A5
	for <imx@lists.linux.dev>; Mon, 30 Jun 2025 14:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751293623; cv=none; b=XJSHTEhpJ3CrfjEKXPRrCnGTcs/P4MHUpUkk1yPFnufaUVm49Jgi7uGV3rx7UuFZmDWTDfpRNmm3K4LsGsLO4PSUBBSGhadkf6e9edA10I7lEyL+cm28dxO4tjYuXsX9C1ZyiKXhyEe/w+5dipwVgQ/PLjOeOax4w7IUIehKTdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751293623; c=relaxed/simple;
	bh=7df/gHAWH0M/f2MpyrA6jV7WVUOkgH08YWsrx7B+PdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CUDhULVGkdCVdkJL1tLm3q+Mwik+CdDwkpj9UO+quOsuIq9hiSSnzCSldwGXAfBj2lFEIDDRmR4eM0CBXB2BxndnDd311eCUbPuN0ruToA5Vv6l80FWue/K+sVNHznXt+ENr3+JxvUc/6K1G/Mx+X6ouGPUUUzuxgsKhRV7ldvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Repw+8Th; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Repw+8Th"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7d45f5fde50so57663485a.2
        for <imx@lists.linux.dev>; Mon, 30 Jun 2025 07:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751293620; x=1751898420; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D+xcDwEq0XwCHZxX9UAE0a2YYZ7EsQktIBuBGKcEcZU=;
        b=Repw+8ThKDsyOoquWGgv8WIulzub0WWbKLdoD6qbuUiQzPCBauQDerIsU8ZPtw6wax
         RX98etp+9bSYTWrlnRsjn0dVB6/tupqa6i7ER6m+IF+j8Jj29k9kKflWg0+Gti5WQS6G
         f/j+YnE8WvmJC2sGD1zTwMVrRFwKuCuy7MxEAGU/Cc3CAdI9Mo0FxNJvESrDUAbn+/1O
         FV+Be/s0l1morshd9A2SkIgSnCHFvY47SPxA9c6/H7x876QlyM+jmQajwhpG/uHBnO1x
         mcsupSg6C5g153FREFPSl++PoY0E8ozByfUKXCopn6KWoxY2HwA6pFmgghese2e/qMRg
         qRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751293620; x=1751898420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D+xcDwEq0XwCHZxX9UAE0a2YYZ7EsQktIBuBGKcEcZU=;
        b=Bn0pgMBNYMAXmHQNGhqTwGUXLLhS9YaBn0tttFkpDddaekfTFZLdqWYkJLUnN2qs6S
         mMl0imEpse6EIbC8np2mvlIT7zuCAvE6wWUtz5ITYAC+PqRQzkDWXt3tul8n5GtPKK8u
         qWJfE3d1xn62tnb+ZbfQcl/VGQkBXmRturA+FVdL4XqYfJDHjwOFQsBzc95os+zRycTG
         CzQyHS2Emwnfx4Kyj0rXA9E1sMPYNhnCXScMOKgMz66d0RtTH5OgiUgR778gSBlh/9bZ
         4Ne0xw3CIsqULwQHPJXrHku6q6+R3l05tBwNVOWbEcH7cVh1Wv5oXai4O6XfLW0qdkMb
         3yxQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0tay+GfvfmOAehD5XHBWN6/+c7uNjCZrfUzpXay/Zic+U0uWVLpfGQTDNdoZ3sgsRCCg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxTME7cJYfuP4H2HB9J0dvTPZ8nS2fxO4KOVkdK3xatp/OfaFzI
	l4e9VLt5lECgh7Anrnkk3R8xme/dV4ZIZjKcTzWw643e4M3kJLliExOj2iJlO1eASw==
X-Gm-Gg: ASbGncspO+izDfWVRUI9aVg0LIqsOBRLGU+2+Ehm1JbMasQKxxC9Rm2ZP875Z4NQL7m
	8iDbASep95t1pgRaV21BjI+kh1xIzdCDnERyVWIZJgwbNZEXaU/kfI8S0VCqssw7lA0sAqN8UGO
	onZ7gEBC2BmWzjEzbAhZvo2lEwWgN+K5Xbh4dsPeZ+BMb0LIdlKJaX9tSpRPugfTauHPwBb7peQ
	HkJPnTINhlTU9aAxIGxbvwD1NZaQdp2ImVQNulCpWaSqWIGzZiLPZ1TaPIkk09qFnOTiZ9kEAKV
	U1ZoFXfKXiwCuUKToDPD1BDVuqSizysqRkdhf8ILhWbGllmuWm9K418R8iyanN1iVwf/OIjC+6s
	z0W4U
X-Google-Smtp-Source: AGHT+IGY71+jbGJGdpeo34rJwHVbWIWI7MBxdTgHTS5TcnXdjbDpLxKSROASFBgY8g61d7fTealGHQ==
X-Received: by 2002:a05:6214:262f:b0:6fa:c55e:869 with SMTP id 6a1803df08f44-70002ee7d42mr264779196d6.23.1751293619811;
        Mon, 30 Jun 2025 07:26:59 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd7730ae40sm68454576d6.106.2025.06.30.07.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:26:59 -0700 (PDT)
Date: Mon, 30 Jun 2025 10:26:56 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, viro@zeniv.linux.org.uk,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: mon_text: find valid buffer offset for iso transfer
Message-ID: <57695560-d6ef-49bc-976e-836ddc903d13@rowland.harvard.edu>
References: <20250627105651.3653231-1-xu.yang_2@nxp.com>
 <8a251c8b-5ec6-4238-bdcd-8d8001fd06df@rowland.harvard.edu>
 <zbxioq4jk2ykd3alu5j6igmgzmsuainlwelhvl5lhz3iczcqyv@uspbdfpyj36j>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zbxioq4jk2ykd3alu5j6igmgzmsuainlwelhvl5lhz3iczcqyv@uspbdfpyj36j>

On Mon, Jun 30, 2025 at 05:13:31PM +0800, Xu Yang wrote:
> Hi Alan,
> 
> On Fri, Jun 27, 2025 at 10:28:53AM -0400, Alan Stern wrote:
> > On Fri, Jun 27, 2025 at 06:56:51PM +0800, Xu Yang wrote:
> > > The valid data doesn't always begin at the buffer head in case
> > > iso_frame_desc is larger than 1. Otherwise, the output info will be
> > > meaningless.
> > 
> > Not so.  usbmon intentionally copies the entire isochronous transfer 
> > buffer, even if only part of it was used for the actual transfer.
> 
> Ah, I see USB monitor only copies DATA_MAX (32) bytes data for mon_text.
> For mon_bin it copies entire transfer length data. So I think whether
> the data is valid or not matters for mon_text.

Given that nobody has complained about the way it works, after many 
years, changing it probably isn't really necessary.

Furthermore, I suspect there are no usages where the transfer 
doesn't start from the beginning of the buffer.

So overall, I guess this change won't make any noticeable difference.  
But theoretically, how would the user know that the usbmon output didn't 
start at the beginning of the buffer?  I think you would need to update 
the documentation as well as the code.

> > > +	if (usb_pipeisoc(urb->pipe)) {
> > > +		isoc_desc = urb->iso_frame_desc;
> > > +		for (i = 0; i < urb->number_of_packets &&
> > > +		     !isoc_desc[i].actual_length; i++)
> > > +			continue;
> > > +		offset = isoc_desc[i].offset;
> > > +	}
> > > +
> > >  	if (urb->num_sgs == 0) {
> > > -		src = urb->transfer_buffer;
> > > +		src = urb->transfer_buffer + offset;
> > >  		if (src == NULL)
> > >  			return 'Z';	/* '0' would be not as pretty. */
> > >  	} else {
> > 
> > And how come you didn't modify this branch of the "if"?
> 
> I looked into it, but didn't find any ISO transfer usecase using sglist
> to manage data, so I skipped it. I'm not sure if my understanding is
> correct, do you have any ideas on sglist?

I'm not aware of any use cases like that either.

By the way, this code runs for both IN and OUT transfers.  But for OUT 
transfers, the actual_length field will always be 0 (because for OUT, 
the buffer data is copied before the USB transfer occurs).  So the code 
you're adding would skip the entire transfer buffer!

Alan Stern
