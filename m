Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903B0202989
	for <imx@lists.linux.dev>; Thu, 10 Apr 2025 06:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744265987; cv=none; b=STf054qaK6KGb0NjW5nfK/32KHfkwcQUAVKEjIXjOS09IKWo8DmSgbfiZvpaYjpxh1V751x6a5yRlwvP4C5HeksnZWYlLBNvA6We27QgC3+lsG0ux8Ww93VgQZwfhzCfS4GvnbPaB5Bupt/hWbGYUCdSEk0HUln5tyP1KCXfvUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744265987; c=relaxed/simple;
	bh=fNKcWfeOv5X1UZBWJNkpzhwgnAdoDWDmVg5nRct5t9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a5FoHkyROZsEWLbAavFMVetXuc9l25sR7mwf2aHTy7unwE+ELiZAiBhRuPaW8r1NUBXW+qF0AvwPblTwAZ1NF0B80rsQvytoLNgjYNSHTSmGvelxrBFeE59BATiL07cgXJpKb3cI75PQPx9i3xYWleepz6oNaMOHrToxWs+7Q5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TKVQnQUw; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TKVQnQUw"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso4706395e9.3
        for <imx@lists.linux.dev>; Wed, 09 Apr 2025 23:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744265984; x=1744870784; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fNKcWfeOv5X1UZBWJNkpzhwgnAdoDWDmVg5nRct5t9Y=;
        b=TKVQnQUwye6wJv5hyVbLDZh8srvRR7hfNJK7TMHv6RrF+Jxu8DRrh/eBWmoeQEplwj
         uDZs8kBbUkSr1Lvv1hbPEG7c2TpUGsFgRcrjLtFgPpRpJjjxZvJYKEHeXQNk1CLtuFBB
         2x64ccRaj5SQ6Sf1oJt8Sv5VoHAG8i5wdWYy3bhxJp8AbLPEfkYeOFixZkgtI7xSlIuS
         HkmxQnTmtqw0anaOdO5fxdcE2amW5M8bxFD/hUax26wWpN7UOYB061w3Q9VauC8CLBx2
         V2BuXtFllYzD4Cp0XfsWfY7Kc5K6zNoa44KXdjR/+d76uq4pxTiS+SBu+HHvr+2KSub7
         0e0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744265984; x=1744870784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fNKcWfeOv5X1UZBWJNkpzhwgnAdoDWDmVg5nRct5t9Y=;
        b=Mqx/CqWTL43JpL6eic+U3CdmMrbsKwOiu/aEvKhXTiycuADcjwcpOsy0An8pQj9wAr
         WsdmIN3wrTn/zMWLtgNgeysKVzVWOOfTl1TEpGiy5nXBVzIJVJZO2WnNUacLoCVPxvbd
         AYebzcYWaymy5u1lSeLxPeloxV9iKNjvqhN0i+LIDCTxgpww/hwa+FKQgqe7BEPIMyuB
         5ANXrD5EgYgpxEl2E9KsJWl+/edqZlFsZjWziewCphphsZfRJlNnZMRsqZUUdltAWl5A
         jEQgr58AOKkHZG7Vrs3Tk406ruaQ81LUvlj8opfEwp4H9CPCBgT1v7jiOJ36xhCwZAVO
         x02g==
X-Forwarded-Encrypted: i=1; AJvYcCVXBOXm9dL3oRkau5uUtq20QUrxol4j9j1sZvj58FMjLW6s16O+xTO6iQivXqTV1NrO8D0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5Uu/UdsRzaMBkVQtVES8xhH9mPfZT/Vr1FDDNCVcae9KzPQZK
	LIJNgPvyMLxIyezWVyNgd0dk7iHV2Fxa0lLdWdUSyVpduMVnnt/7TJhSTBMzxac=
X-Gm-Gg: ASbGncvgliN/PDo1QYlgXHdoMyx+O3DCyM0/yb6E325GJg6K0ADt+ozMlx0vdbZrbDu
	DlFTgRIrSCsYztJm+51aH9Erl8R2xYa8VrRD0g8WSMtrPbzH5Z8jSOnQV8d2meYRuL4lwD7Bg8x
	lCoO/zu5zAmbMeURzusgZ6vdDqXYifSka4rVdwQI4FnW0CH+LlcrMscZnJK0d26CJC7OOWFe8AS
	yMywzJScBujqjgnd/GfpAA1rpbnvAl9BqfCUo6fJz92wcSms4tYDhY73Ji/+ZsEvK/Z/fx5lj6B
	V+ETjRd6a6Y2z5cgUpa5qsukKZC+Me/QcI8NG9Jl3IluhHXtxWdIz1b6
X-Google-Smtp-Source: AGHT+IETxKgteFp+KK8rObwmu67CyaszSv6hN7I3pcGlN+mzeZYmJ4TDp+koJRpZX2WmH9ySINK8Og==
X-Received: by 2002:a05:600c:b8b:b0:43d:4686:5cfb with SMTP id 5b1f17b1804b1-43f2d9604f3mr15862495e9.27.1744265983907;
        Wed, 09 Apr 2025 23:19:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43f23572bb2sm39720035e9.29.2025.04.09.23.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 23:19:43 -0700 (PDT)
Date: Thu, 10 Apr 2025 09:19:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Siddarth G <siddarthsgml@gmail.com>
Cc: slongerbeam@gmail.com, p.zabel@pengutronix.de, mchehab@kernel.org,
	gregkh@linuxfoundation.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Subject: Re: [PATCH v2] media: imx: Fix NULL pointer dereference
Message-ID: <e4252054-69e0-4f65-bb75-54ba4a24e5d3@stanley.mountain>
References: <20250410050543.6963-1-siddarthsgml@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410050543.6963-1-siddarthsgml@gmail.com>

The same comments apply.

regards,
dan carpenter

