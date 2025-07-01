Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052B0191493
	for <imx@lists.linux.dev>; Tue,  1 Jul 2025 14:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751381487; cv=none; b=dPB0XNKk4iHt1ZmsGaXKqz123sz9Z+Dsds3qKz6QBGCgeu1y4NBOlPE/XbiOIjbrKUVrEb7ula6wHx1rqp2HKJJKfmxR6O0Vwrq0w8ERoClhi6cMVX5m7Pdiqpim3DlKbquRN6WlVbIex2v/CqawYU3J/1S7RxoL6IK2arKtUBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751381487; c=relaxed/simple;
	bh=UzoL7K1DgbELUOr0ui+iyWIzQaK+LJsdOwm+clz8lm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CsFNOf5HIpGJAJYQu50D+TYOsECNpu0Vy2Jc2rJ9zOsoTZdEVMxOetX1ECwFHuI3pUJg9N1AxpB5A/tcEadANERcPgxx7Ae55n34pY82m9GtNBrGbVKXNSfguZxBNu3kSHO+sUJr/4ASCL9TE8H3fhGPsZeeFbtSyO675Wp5LYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=d2mma4FV; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="d2mma4FV"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4a43afb04a7so23424031cf.0
        for <imx@lists.linux.dev>; Tue, 01 Jul 2025 07:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751381485; x=1751986285; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vlt6HkWsjPtuDA7DFavNWsclEgVzxWUAqR2DN4vxaeo=;
        b=d2mma4FVt6X6CznAvvBVH+c8u1AAg/iU0RLdsKabJdpTfYr5Pwbd5OW0YDa6V2xFBV
         1Wnqn60PliF6gHKk6Jbo/a1XWPSwGY34Qf3W73Y9zruNnOuZysi++WkpeFjK0A/XQSAe
         vFups2N+ZfX+GHbNRRc3K/uYuWsBz38yIqUnMR4zpZamr+S4O97U+n8JltnszI36SzjT
         LlsxfnTVj392LTBZ3w8KYOPwG2W2xORbxZffXGjHr8oCBSTaedI4Vd/rHT1m/BjdcclD
         8hMNV4xt/HpmB43LfqiOznNJx1K57XmtUURY0aeIORMYO+qbWKXWYPcHbY4a2A9W1VlF
         d7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751381485; x=1751986285;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vlt6HkWsjPtuDA7DFavNWsclEgVzxWUAqR2DN4vxaeo=;
        b=CQrP78fmwWqqJS+9hfljqcivO32xa9N0IhrAimTjNNrJD3GejltFShhpibOdvNcsOT
         F7RLFjekC/oBy0n0mIUNKOf/EeTnIEUzBceU2l7Tf848M7Ue3GLOJ+A0/HvpJyiE+816
         bE2Qn0oPZ+sFkhmTq2ZvSoKCPYXbtyN6c6TPhGzbj91GD/eIlfDj9qF/Dg5Y89nSkCuP
         lCJd6MNLHyQB83jL8WCkMAxVNVWOEHfnXqMBPynGp4mTrXTpoRTA9YhzNg1Ah1j8qlgf
         frCYA9CqiVMXDYjuiqqG55eDdYdFo5TDTCzJ02+K3243ujsfbAeMr4tvj3JewSD6Zdn+
         ybWg==
X-Forwarded-Encrypted: i=1; AJvYcCW7lh9cWcsnnR2IE9p8+ks/NIq0zsrzdPJODG/DLKehCnMjmBPnu6zmRp3NASk+r4u27sY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxyBU/8ijO4HOfKRYLmY0Gg2RyfI/scthvyJM3uNX0zMb1ogjD6
	k6c67Ml8zQ1J2TsmSWtlPW4ESzn4Z7KK0qA4rk45RcsgHG9XM1iCVfV03Viyi48MZg==
X-Gm-Gg: ASbGnctw3BZDw08QA6BxxhKR36N5X0/fzMLIRy5wkOhLpeNrHZbN2koXzafbzYNlpUJ
	N866f9FkeWaKP7trcyPAKVMtLVcQwLkYlsiEX8ldD+zXAxWKvEbM65Dk/89J7DrdYdgBmfqtHAq
	G0H+2wRdpwgDEGwiWuxR/fef1jJ3+ICxvzp8JyQyfFNuaF9Td8irtVrj7zPtv+zmCAJfo9NThUN
	1/4qRbJ4oI1eNBXyU0tGiOXxBiO5EdsS0L670qUj1Yn6Y7gXusg5OiDQvFF5tPfrZwQws7fXIPO
	FfEhUH+3km0mBGDGUd1UBXAptEBYWnMrkAHU+YzZtD/q2oWBx9tmWQtEkjMIRMNPLcGIEnTHY0K
	XBwB4
X-Google-Smtp-Source: AGHT+IG2WAgD69R5Cx0UOslTbeqnt6ZmQFs9jqLYE9iO9Eo5OndYvPnf3ly/vD3jcuVTySG3VSMUiA==
X-Received: by 2002:ac8:74a:0:b0:4a7:fbd0:79c4 with SMTP id d75a77b69052e-4a7fca97159mr244132201cf.11.1751381484546;
        Tue, 01 Jul 2025 07:51:24 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc592cc9sm76815851cf.72.2025.07.01.07.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 07:51:24 -0700 (PDT)
Date: Tue, 1 Jul 2025 10:51:21 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, viro@zeniv.linux.org.uk,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: mon_text: find valid buffer offset for iso transfer
Message-ID: <adfbd9c0-4bf5-4dab-974e-4afa61d8492a@rowland.harvard.edu>
References: <20250627105651.3653231-1-xu.yang_2@nxp.com>
 <8a251c8b-5ec6-4238-bdcd-8d8001fd06df@rowland.harvard.edu>
 <zbxioq4jk2ykd3alu5j6igmgzmsuainlwelhvl5lhz3iczcqyv@uspbdfpyj36j>
 <57695560-d6ef-49bc-976e-836ddc903d13@rowland.harvard.edu>
 <fornnnolaxn5zbw2dnepq2higyf5vw4dkdn4uptgz6tuki4zoe@wnclvwajtila>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fornnnolaxn5zbw2dnepq2higyf5vw4dkdn4uptgz6tuki4zoe@wnclvwajtila>

On Tue, Jul 01, 2025 at 06:16:23PM +0800, Xu Yang wrote:
> On Mon, Jun 30, 2025 at 10:26:56AM -0400, Alan Stern wrote:
> > So overall, I guess this change won't make any noticeable difference.  
> > But theoretically, how would the user know that the usbmon output didn't 
> > start at the beginning of the buffer?  I think you would need to update 
> > the documentation as well as the code.
> 
> Does the user need know such information? As a user, I don't need it at all.
> I just want to see the data transferred on the USB bus.

What you want is relatively unimportant, because this API is meant to be 
available to _all_ Linux users.  If it is changed, it must be changed in 
a way that is acceptable to all users.

And of course users need to know how the data is presented.  Otherwise 
there's no way to understand it.

Currently, Documentation/usb/usbmon.rst says this:

  In the case of an Isochronous input (Zi)
  completion where the received data is sparse in the buffer, the length of
  the collected data can be greater than the Data Length value (because Data
  Length counts only the bytes that were received whereas the Data words
  contain the entire transfer buffer).

It doesn't say anything about the collected data beginning after the 
start of the buffer.  Just the opposite, in fact: "... the Data words 
contain the entire transfer buffer".

If somebody has been using usbmon for a long time, he won't expect its 
behavior to change suddenly -- particularly if the documentation has not 
updated.

Alan Stern
