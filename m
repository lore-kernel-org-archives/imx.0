Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87412C1A2
	for <imx@lists.linux.dev>; Fri, 18 Apr 2025 13:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744984204; cv=none; b=ZsBMMRR4iNTMbrHxinA/SN4wRBt02U9cqZOJntAjqnM0GB0FP1yY6nZ3Y3c99F++EKC7TbLjmUKJJeBJ/H6KIUQ9PyKPqMc/ECAflBcINds0pNbr1vvm8SMGzTSxmAbt2Z4VNWAsd0rWuq5wOMU7NpE7cqLhWIhZT8N15YIx5VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744984204; c=relaxed/simple;
	bh=b3iMxPUCQpRg32E9ly0v4ay2UEkLVA23OpI4WICveZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QgOgHmXBwNAcevlIRzJYdudWCUAAgAqDSJ1EmFJF/Ket6tTpeib33zcp+n+4+ew9uHOfvaXj1b+yf5VRO+wtqzhOQqayUIhlPeBeWVvM1pMrYo1A2FEIw0jrJOmS9hfR5tyeD9zCrVfXRA/mzD7wlqobalGqGgJKmUKrS82o9hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EKPnC3nf; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EKPnC3nf"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e82396baaeso277823a12.1
        for <imx@lists.linux.dev>; Fri, 18 Apr 2025 06:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744984201; x=1745589001; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fY+hDpLzJtBhDrBf6wESfqlaw9mSea9W1+P81uS8duI=;
        b=EKPnC3nfx8jv7U7PIUT0Xk9ExOG/sdvMfqOaodJJjba0M8wz24WrmGr/zugKZ9S+pY
         RjFz8rWfb4ITlRU0rDUNepoup++IxdXuNKn/12KNnekGRtXLyjIZDD61oRDs40khRXtu
         V8tSE9kfB9xAzL2Pb9Ul0tqocSjZvaUtP9WMCzqUmMtU34bmu67nbFPBOUtGZs4z652C
         s9b2JJNK5xQSG8okNBwgER/AvZKIFqe1mZ4u+aWOmRkE88cojY6AgdtvYCWPEO4TLJw2
         QSDn56bvHp/zPnVM62uq0VP8cqCFRMhG8Jc9VNbJPtUljpprhOtKK2C4/juq+9zUpj1G
         aGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744984201; x=1745589001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fY+hDpLzJtBhDrBf6wESfqlaw9mSea9W1+P81uS8duI=;
        b=EtcOqbVwvHoaUwPsI/Szcy+t+C8mQ04FhRJFWxGl3Dr3wQJgFDMIXYBWuM7CYHeDub
         pMRR9/DJpmKwQikzNKvdVjvKXHquQIG4ePPZrs4i19PpoIVZ5ZbSfxZ3+it5XjyvaBXG
         ddkh/mm9pVJ9hQkQ6neEhM6as4+AEXW4ouBSwbn6U7I06bJl2KRBga+jfPn2I17VGWRm
         DnBMsAz+7XgY63ke7JO4ffb5Q8fuD2si6UZegngPFZ3ZGzEf/mNGN+aK3hQRruqDN0wq
         o4nkcgn0C3ie5wSyE422C5HzI2UoqfzOkKYmuLrw5mt9Vyu/fPhVrmwrPBu8S/YCXcXR
         G33Q==
X-Forwarded-Encrypted: i=1; AJvYcCVBKMlrY+JrzYNaHUCBnc+r3bMKMlw5eK6EPkvaEe+5JPIfMQ6Kr7rHq4wh48zJqkS/sik=@lists.linux.dev
X-Gm-Message-State: AOJu0YxfoSJCHbw9eXOV0Hn89chHjxLEftk9PTZgHhYTU8z8xje6nxwx
	kg0ea4xr/Epvm9G6X1ewxkI9jVBQNetR8QvBMxNCHBKu1OrvNkEQ
X-Gm-Gg: ASbGncvfTHmqH2YTtPfU0FnJkU0st6KbyYoZH1+b0wnPkqhdFV4r5wKL/W43Frk5ZAL
	vKGxw02Mr/0S7dOusMugGDY0DWAjFC0jEjfOalNw7xY29UwdD4VHzS8YfF4RbhMhqvrA5SA30I0
	jwMKjsvKyWHzYAThc3Xl9hywopqVZSf8U2QQCmL+ys/T9JEfcU9V/QUYSFeCCn7JZcbpuh/d9WX
	1T6tvSZbx8gC80Zo2LBqh7UQ+cOx88dh2goc/Z/gQlvbECi+c6Z6mTeNnHUGD8txvZeYO72Nl5K
	P+6fvXR2DiIG2NFw2fFOzHprOcyD
X-Google-Smtp-Source: AGHT+IHjfpXDYgO9pT6Nw4Bezw1GjCosswQdk5p/7xF4ENGHQ2fIxqrauhJGFISGYIYBcl6ucEQa8Q==
X-Received: by 2002:a05:6402:4312:b0:5ee:497:5221 with SMTP id 4fb4d7f45d1cf-5f628628bdamr756775a12.11.1744984200603;
        Fri, 18 Apr 2025 06:50:00 -0700 (PDT)
Received: from skbuf ([188.25.50.178])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f625578345sm1009703a12.28.2025.04.18.06.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 06:49:59 -0700 (PDT)
Date: Fri, 18 Apr 2025 16:49:56 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v5 net-next 01/14] net: enetc: add initial netc-lib
 driver to support NTMP
Message-ID: <20250418134956.chlx2izlo6qcfzic@skbuf>
References: <20250411095752.3072696-1-wei.fang@nxp.com>
 <20250411095752.3072696-1-wei.fang@nxp.com>
 <20250411095752.3072696-2-wei.fang@nxp.com>
 <20250411095752.3072696-2-wei.fang@nxp.com>
 <20250418124905.2jve2cjzrojjwmyh@skbuf>
 <PAXPR04MB8510715CEE1461C5CC8D8CC288BF2@PAXPR04MB8510.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8510715CEE1461C5CC8D8CC288BF2@PAXPR04MB8510.eurprd04.prod.outlook.com>

On Fri, Apr 18, 2025 at 01:38:31PM +0000, Wei Fang wrote:
> > Can you please add one more sentence clarifying that the LS1028A
> > management protocol has been retroactively named NTMP 1.0 and its
> > implementation is in enetc_cbdr.c and enetc_tsn.c? The driver, like new
> > NETC documentation, refers to NTMP 2.0 as simply "NTMP".
> > 
> 
> Okay, but enetc_tsn.c is only existed in downstream, so it will not be
> added here.

enetc_qos.c, sorry.
