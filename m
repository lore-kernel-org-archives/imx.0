Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894A2237180
	for <imx@lists.linux.dev>; Mon, 17 Feb 2025 19:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739820614; cv=none; b=l+SRnGnyhO6ceBEgZxCI1DQyY0HM1T18dIYSTR/ztnn+uQrYJLte/F5oA3IBmHsfsReh1iqypee1/uUQhSyqNadIA0VbG1Nyde13U8BeFyJo4hrlhPi4Rv4ezb3HuBnEgI19fW2LvwUgW8uxHCkKCC7v7JKaNCqgTPEVelTzMTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739820614; c=relaxed/simple;
	bh=oWFGxE5dGctrEPb9coH4CCy8xZBZZ9CsQTMTjo0QChM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZxogYylKoC9u/D4Wy0jbkc3usZ6qaEGMMgDQrNox5ZrvvTPNEdtPHmpex4d9OgNN42zuLl/OnXJOrkqjKd1XKfL2k7/mXckcKkniAqdbnBpHRC5yEBK5hqnCypmpDqbdW/q3ltTTBhTrH2yCF/Bub1bUooSdjJkaqYVLJ3/+m+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CoHijTeq; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CoHijTeq"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43962f7b0e4so28751575e9.3
        for <imx@lists.linux.dev>; Mon, 17 Feb 2025 11:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739820611; x=1740425411; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KBBGRVrDPOzL/cJXETAGl1eWZIx2QG5N8tUkdFnRiL0=;
        b=CoHijTeq1xdOGLGoybsVCxpdeB8uBld+LeOIzvhccz4DlXG+BCNEn2ggz/qUFXmNgu
         m4TV1xpI015DBqIul9mW2SVrH+l1VPBvFdOS/bhouXy7RgdVhrxIWvrbX1D4K4dDYTYR
         tWkRFlUw/ihSg5ZalYX1QpBS3bUT4swKxBZAAmf4ui3c9iv9bqKEzj8cs2RYHU8dZj3Z
         f7pK0Wgvjq1I9bGYLpmmzrE6I9yhOH+WN9j6hlZzE+svK/Doiz+xCeV4wXcxE1DoGZ7/
         Ok8M5a3yPPlx2wgb89R+0KLvJpCHIYxubCYZCeXhBjiuHVHc1hGSXv9vDgFclqU9b5jK
         qyZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739820611; x=1740425411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KBBGRVrDPOzL/cJXETAGl1eWZIx2QG5N8tUkdFnRiL0=;
        b=schzpp1xsTwwteq3lhNkYR36awJ4b/45LM21V2yGKx6pnZ60kHYiuAWEdkDVu67mkg
         zxK0GYGuFWf6i9qKCNyqKDXB8U+oY6nLkBRCj8HMfA/Uhk78yvKB+do5iWHIGkWvXph0
         +osoYyIsA8J8cKUxxZLxIRjXc4hmwpmihAhM0Mw5lqUO01H6PAtylfp97pe6Hv3JjR4S
         RQI0GwUDZugg/X92hJP5orDgj5hypT0R42o/hNcw5q6rAMQmGdZDFkpJQ1IlYfHlgikX
         G5g+ctLV5257u6IPQlasrvf8JqPQt7WTQXSgZQDYs4ylInlJv8xvFVIsSzfGvZJowJ52
         ZuDw==
X-Forwarded-Encrypted: i=1; AJvYcCVfvOQ3s8JCLgWo222QdYcXe1zMsZdHzYnh3XaUXqBub75D7qQhAgV288t2pBbfaMyabvI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxuyAq5oACAEdeJ0LtvSJiZPJBxBjC+nXzW8xH1nYH+ufeBuYn4
	uxIBlDV9aVs02q4NSB88rXMA7wWB63UjBCdwcwrc64t6+PYT3ZST
X-Gm-Gg: ASbGncu62D/SZdfxQ9acdtomB6ZZKYzSZLpzFkT13rf/iY2wHE8WC5rdIaJmvx8UshV
	HSDxTVfWjtxEgJ0JRDsMJRV1ZtILi/YTtx6nGCK/1uzmzsVUdpTnk/pTEngk9hpTXK6b6mCq3Qi
	oJnzoJ+KdhVfi5HwkTmURRItjiL4izXMK5nyc7obNUKLsJoAh48ibWBS3EX9meTAgQ8S5efvvLb
	VtiJzQo2hswul9jWmXDJdQtU1VCxb0Ksi7lqB9IWOCutRWh3RqkahDXStvY/vZfXLjbg0yTlHhT
	y0FXXfWgNdfTwg==
X-Google-Smtp-Source: AGHT+IG/GTBYMutX0ifvnaDNTHsFLz/DL9WhNAt4ojV3o2SFm28L0BvhF5nSaoivdCJhJhpmzmztPw==
X-Received: by 2002:a05:600c:4f02:b0:439:930a:58aa with SMTP id 5b1f17b1804b1-439930a5aacmr1691095e9.0.1739820610515;
        Mon, 17 Feb 2025 11:30:10 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72:0:bb08:332f:1cf1:cf5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439858ec5fasm34378135e9.29.2025.02.17.11.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 11:30:10 -0800 (PST)
Date: Mon, 17 Feb 2025 20:30:08 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, francesco.dolcini@toradex.com,
	broonie@kernel.org
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v1 1/2] arm64: dts: freescale: imx8mp-verdin-dahlia: add
 Microphone Jack to sound card
Message-ID: <Z7OOQNnlGCAfWYws@eichest-laptop>
References: <20250217145744.179213-1-eichest@gmail.com>
 <20250217145744.179213-2-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217145744.179213-2-eichest@gmail.com>

On Mon, Feb 17, 2025 at 03:56:40PM +0100, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> The simple-audio-card's microphone widget currently connects to the
> headphone jack. Routing the microphone input to the microphone jack
> allows for independent operation of the microphone and headphones.
> 
> This resolves the following boot-time kernel log message, which
> indicated a conflict when the microphone and headphone functions were
> not separated:
>   debugfs: File 'Headphone Jack' in directory 'dapm' already present!
> 
> Fixes: 874958916844 ("arm64: dts: freescale: verdin-imx8mp: dahlia: add sound card")
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>

CC: Mark Brown <broonie@kernel.org>
