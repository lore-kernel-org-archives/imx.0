Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8816727B34C
	for <imx@lists.linux.dev>; Wed,  3 Sep 2025 13:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756906896; cv=none; b=DrmudbN49rtu5A14qIYGiMG48SYmpjEB6SXih1Ebw6FHFAlmqEBdWoWFss7/PnvcjrXQbvzoOTlao9Bjzn3vJXIePecUnNFdTCDgj3S0F3miD4oyKCkfbHnzU5bN1hUatVu2Vo0pgjJsYVQ3bQB73IxMDsL4zzHRo3AvxTy1qc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756906896; c=relaxed/simple;
	bh=LtSHdTfd+/QVVScrEVKfgAJRnBoREvz6o6zvp2ZWROY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tPKUbq6ParmxzxelUABVJ4S/vsyFzj2ws8A6lZ615xek2gBggrvwKVbYgka+A7rKPouTEsVgzivOQgUqV69LLzj7hQL7PBVh3DH6Oio1FWjr+QUgGaDBsCeyYSSUcAXEpY+qGUoUun1EEbvXLS8p9mccw61b1IfueFs5rROcIt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iaa0lf3Q; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iaa0lf3Q"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-723960ded6bso27330937b3.3
        for <imx@lists.linux.dev>; Wed, 03 Sep 2025 06:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756906893; x=1757511693; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LtSHdTfd+/QVVScrEVKfgAJRnBoREvz6o6zvp2ZWROY=;
        b=iaa0lf3QiYzX0SAeTzyX4ieZK0m/MjAomjzjT4T27lstyXGHe3LpATrrFKN9wAVexB
         Ky0IuMaq/6kwIHC5R7XRIz+Cv7K/BZvm1fagxSwaBXBtsNupjQ7QeNh2C5LgSA1VTVsf
         N8OEwj9mm6hBhzqjkYDDwzd5q0LxzV/VB9LGpUIUFILUUmp6DlTXp/x7bg0i2yLEDO4x
         Vguv5h/QqfhahgJRsv4oXtqZDw35lBnoQG5rmPgBCNdV5wA7MMjXqlIj+iwnKrZvBDx7
         m8eRw2L3cRbXcA/jafme3fW2danVqaPr4HJ/o3CqfTAzcHNS9ZWq5MY1Xe2tQPg7Wtgt
         v+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756906893; x=1757511693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LtSHdTfd+/QVVScrEVKfgAJRnBoREvz6o6zvp2ZWROY=;
        b=vpmU+sVkbxSA7bMsS1n7zk/fwKzv1LxZT135XechpLdICL9Btea60ZqIu+U7i8+9+v
         ReLb/7/KUGOruks+eaZ/Khy1QaFJCk0kKOR8o5LrvzUfjCG9KAOXLmVFlEm4CzAtWTtE
         IB31Qx6UeoK2GsKeVhFHITSlJ+N1Lxh+kAbt9deX0neyoZFcWU+PShOx4pS7TFII6yp5
         xGctpWw8EITusvhPpN9RXIazbY4zEgOnCxaVT0bCMa8DYCTArx5kWGiw3tgnfpUEp8vR
         bKz1ENLXrgCOOMchS4A8ap8YOhLhjED5A+TnSms0bh47MOEXM4jNoa917D2X83/Jz/gJ
         xuWg==
X-Forwarded-Encrypted: i=1; AJvYcCWbyvfAjzlrjBDIo+Oq/NgLyRtQkHNv82CCJG4aNIS4P/vIfYIWZnXSMO5iLm2kD32aONA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwVR2OkDy2pHCtOdD4Sb2DAMKZXXtdm2R72ByUi3wGlc2KChATj
	5e64N2t9WEfAemRSZrp9kOeKqbwjGwOAik0CcQ8gkdD6ohZG8UbhAgFL
X-Gm-Gg: ASbGncud7b17hMUw0h/uPGSUO6VY5oYgbyhsQz+wOTSbeYW3zv5nXr8HqBM/xKnzKVi
	AMMr6Eo4QpfBi5AuuA3j8Dfmy87+0lEZPAbbHseVZcWiDtGE8c1p2hQ/3aRvJ/NSsInnI0xXlFA
	UO0lS0UcMulw7XRTVc7Tjg13RJu60TIBqeMvvJF3u3HTbDJHdjeRDhFfy60Mqw7ptSp4yPBSAg3
	fbwUw5OpTZzqexe3GGzv7KAkSD8u6rwdt4qrafZj//FBZGl7hxRSL3cjx4/z+wGs9vOsMnxm67o
	n8c9kUu+0IlIUbpMBCVHomoOAAy6vZheNPJ/ZDW3QvlIfBCubywlXNmHJiV+LUi9H5L/irmDfeY
	SnEPyDv/nvK7/OYqnQ9hv0TWy8aGTRxqe81fiCYs4yuveEFchxCOR
X-Google-Smtp-Source: AGHT+IGnjHsAyQljYLZz2UQHy207mYMU6/HFTBywuxhNBv3nxCgO5MpvlVh0qFbK1/Zdh77rKiaXnQ==
X-Received: by 2002:a05:690c:4911:b0:71f:e430:666b with SMTP id 00721157ae682-722764acba5mr157076777b3.32.1756906893562;
        Wed, 03 Sep 2025 06:41:33 -0700 (PDT)
Received: from hoboy.vegasvil.org ([2600:1700:2430:6f6f:e2d5:5eff:fea5:802f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-723a8329a4dsm13556527b3.22.2025.09.03.06.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 06:41:33 -0700 (PDT)
Date: Wed, 3 Sep 2025 06:41:30 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com, Frank.Li@nxp.com, yangbo.lu@nxp.com,
	christophe.leroy@csgroup.eu, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH net-next 0/3] ptp: add pulse signal loopback support for
 debugging
Message-ID: <aLhFiqHoUnsBAVR7@hoboy.vegasvil.org>
References: <20250903083749.1388583-1-wei.fang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903083749.1388583-1-wei.fang@nxp.com>

On Wed, Sep 03, 2025 at 04:37:46PM +0800, Wei Fang wrote:
> Some PTP devices support looping back the periodic pulse signal for
> debugging,

What kinds of debugs can be resolved by this loopback feature?

It seems pointless to me...

Thanks,
Richard
