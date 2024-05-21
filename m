Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC6978289
	for <imx@lists.linux.dev>; Tue, 21 May 2024 14:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716303007; cv=none; b=gjz2PucdzXxRr/ng/GE932g98Z0XP5fDmpAlSwb5XHZEkf02asgYshh/r0In2m/9+XrgQM0qpHeD8Io1Z3WcW55G+YtIXfHN9SR9k4W0Kz9h5UbZlCWtRLN1z4y+W8jb1l2TYyli+osAeKcJ7qGFyQye4BtZHDt8pXRznPfr6eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716303007; c=relaxed/simple;
	bh=pebubPRPXXfyFCR8L7jtLdsUm4lQUmAXpv6njO/hTno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i9pc6b1jjKhh9qU3YfPTCB06O4mcHk/ahpg7XL5LjGjo9xEadijKuR7atklEAR2ddnn3TWwoo6g+ecT9+TmjPDzrpose1bQOhywAVc8dxHnDxlEi4pUyqSh50luYXaIGDmHMDqYSYPTm/AVJdmf62PRpRWBwtBlAFcsLdtynv0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1ed012c1afbso31453245ad.1
        for <imx@lists.linux.dev>; Tue, 21 May 2024 07:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716303006; x=1716907806;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwzjLH40P8V9E/pVlXPrZq55s5peR2Op7oBzdA+LPLM=;
        b=nuBVfY4ANamGNln0CO4qDK+qwmXbipj46jbp17+lqJBYCuG7ICAo2H+YHuadJ1tuMg
         h7r6g0/6dfc1yg0lMy697y1vfrsz7wS+sMgzbs0IViFvrPSxDyKhwXQJkByUTNhaBZzX
         Ium9FuQhOZjN3OGEy3IN0m9tYcYOQ11jS5lUdpMhtjiU/MYLrMxDe4YRO4Dw3F9JKd4C
         /JfCZ6nfm8pXKm5j3UY88XU4vwonbdR8tpyVU/NnhqgDG37t/Gy58YB8ffpIwTpUOYCU
         8oqA6SIxKINWDarWI57kSJX65Zpr+XlQz2cwk5277xJ9IDIrHt0naX5SQaaIu04wSe5q
         oYeg==
X-Forwarded-Encrypted: i=1; AJvYcCUv2q8jPIgJh0U5Nqh8qzIWc6NazBRgaV9LqxIrBEu4whvKKIf3SBMmFM9ty+JYr+BuxXiXzJF2dvT/QRvfjzo2/V6f
X-Gm-Message-State: AOJu0YzxEuryR3NDbbwLo5XVOlpGUTBA2rV01Lp4S3meJBrPYnnmPiSO
	dbPM49WIg4w2padnIeM7gN+T/tWdqLzaPPh0rtV1K1++9N+uBiE/7PKebw==
X-Google-Smtp-Source: AGHT+IFqkbX9fcM93qNGYYELn9oB3kXdWgI0rAcxzTUvgY0Z1FuwpiabK9+9x9fAXjhm7RJagNFfkw==
X-Received: by 2002:a17:902:f78a:b0:1f3:14c:c2c5 with SMTP id d9443c01a7336-1f3014cc5cfmr75332335ad.31.1716303005705;
        Tue, 21 May 2024 07:50:05 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f2f9878c3fsm45998555ad.30.2024.05.21.07.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 07:50:05 -0700 (PDT)
Date: Tue, 21 May 2024 23:50:03 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Damien Le Moal <dlemoal@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Niklas Cassel <cassel@kernel.org>,
	bhelgaas@google.com, mani@kernel.org, Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev, jdmason@kudzu.us, jingoohan1@gmail.com,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	lpieralisi@kernel.org, robh@kernel.org
Subject: Re: [PATCH v4 1/1] PCI: dwc: Fix index 0 incorrectly being
 interpreted as a free ATU slot
Message-ID: <20240521145003.GA241395@rocinante>
References: <20240521141431.GA25673@bhelgaas>
 <b7a5e9c2-d2b3-4c99-8628-f48581f5d1ad@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7a5e9c2-d2b3-4c99-8628-f48581f5d1ad@kernel.org>

Hello,

[...]
> It would be great if going forward, a more timely processing & applying
> of reviewed patches happened. Thank you.

Agreed. I will see about improving this going forward. Sorry for troubles!

	Krzysztof
