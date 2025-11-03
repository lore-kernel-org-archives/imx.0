Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6E7285C8D
	for <imx@lists.linux.dev>; Mon,  3 Nov 2025 02:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762138612; cv=none; b=L9TeBCJvVE6WcYY/rX1WA6NVaP5jiWptxya/6gkcCk2Q/pNWlMPz7DxpW/hYWkimuEw52PwSO9w49M27saCFEYohS/ZWZDTR4nOo9740tiC0JtqZr7m0OGOCAPktYr0R+l5T0R2h9QJLWON9TEdvpxzP0ZCJg8fs21KY+OHjUuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762138612; c=relaxed/simple;
	bh=K3WdlMEenyOlgL7RySRR9VaYppdP5OX+9TrOPWHWI24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F/4eNlao/39pQ1A4Gq28jXApLiaCJqSTf8uyrLhpgrn5FCpiAsa4+DQQB7EgUTdz6Tt4oassGyMJaiyMv3kvp5Wcp40ljRolmsAg2TP3qbkGaXDQGgvWOXi1GhbSfeY9EseY9ZsPuYrGaX6cj05M0Uc0Nx0MkGiocV6vpfHGEzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ez4U2kbh; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ez4U2kbh"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8a84ba42abbso468365885a.3
        for <imx@lists.linux.dev>; Sun, 02 Nov 2025 18:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762138609; x=1762743409; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/9M7sgDBGpwY7jPR+4iEMdrWP+dRfhYDD0v9Sn6GaZo=;
        b=ez4U2kbhui+kOWWCbAyYsEmh2Nr2avUdqsjfN1t4Dlnq6ZTIpJSXQblC6AaKWLPwr8
         oC1v2vMF0uI88UiRH9xOgqQteJi5psoAYOvrs4BLGLNKH/XnxdAUreQanaF8fZYxRqJ1
         euvEQ3+gYYdbZN3PMxPNU6aPs65KlelAvoX5eXui4mKjMhOic2MYIDTJ5gxPY3Zxsici
         wvBxdqO9U9Vd2E6dmw9+D2hcA1VpqWYc/B4M5vhHfHEaRxR356HrZUEGucM4wNMhwUWn
         ocmyHkiZvXqGMdH5xdxezRixUvE5O0nbl2XsVIT6oSQcDN6sivRLb81PtA7q5cFLj/sB
         yblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762138609; x=1762743409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9M7sgDBGpwY7jPR+4iEMdrWP+dRfhYDD0v9Sn6GaZo=;
        b=gqxaXXy/zjtcv5w0SyII/TlaohiHsnA/vTnHR00vMlXyNyraEXw3HoAVhNibsmP5Wq
         XWpBviKghlOlqL3WauT3Pc2KCkOgdymj38AyK43C+AN0ZQdXqvzFHMeHDVnAS3v6XEAd
         HGOn6B6JVf5Hps3dgpH6p64gAXPwt74DZts1GsNitFwZyh7pJ85VTwKH7zH5t1h1TbW+
         BeM6VGoWz7ICAKNcKMEFK1UV/ueCw39PB47NpgveL9kTYJzQJOs9fNuoreFB9hd8pq5C
         6xtjxQ51P4upjVIOT/oJkMSmVv8Y10TnvpumWuvVq4SXgc4oCcJY+Loz9K2OO6CgsXpm
         Grbw==
X-Forwarded-Encrypted: i=1; AJvYcCVbrA8ksPjQLnyJTycP810fIQfPp0luwEQC0UQI95eFps6q5nzyfPHcqKj+iba+p4+u040=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx48yBI01Sq/J45AVa/ZfnRp/vG4YQ1KXqMTa/TrD7lPS59gsSu
	snl7+j+LQ08LpxaR0sIiF9JuajwECjJ3I1kAclb5CyWIqMq43QIzAIZo
X-Gm-Gg: ASbGncszL6pPE6F9ido5vVvGcyThDpwlyt/hLoKaj26L8e5Z4cHNU+AYQBD/BaPVLtM
	t4xqBR924ftGSjC1NjA1O95AtJRsuf+KpsEeIUHGT5mkivaDfi8TcvE8UHn5NgC2kyt18Yd2Jh+
	45w7K8AipxsyqClKjP4UJ63vnY3coH2UT9tWqh8xsjZKTvKh5Qs0JWsNpMVhH92wEgwLkWxm0XM
	mSp7TOXQAFJMHweYF/qjBh67fznc/2liW8hc/x1WAbQZBAC0VZABmis3ANUfDS/Q9NkO3hghhdU
	bJxAc8AgRuoadA/vY/Xd0Myy8wLe8PkBtmNccTRyMMwLoJRXypr4k8C+B2fZ75uO+NVUCEES+YD
	iPHrtSdSXFipUZ+4hvVcCsBt8JeLpUS6s1riMd13PDNF60RXtISQY1SNU+6koawKJ0ZbEgG3suO
	w=
X-Google-Smtp-Source: AGHT+IHE2TSIZgOp5wL5s2nsuoJjILCUj0bEW29KZXQ7lO9JT98njb8YcrMtNBaqpfa3stmMcbDhGA==
X-Received: by 2002:a05:620a:1a0b:b0:891:d993:1bdb with SMTP id af79cd13be357-8ab9bb6e274mr1288436785a.86.1762138609457;
        Sun, 02 Nov 2025 18:56:49 -0800 (PST)
Received: from sam-fedora ([142.182.130.176])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ac03976ac6sm585893985a.49.2025.11.02.18.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 18:56:49 -0800 (PST)
Date: Sun, 2 Nov 2025 21:56:47 -0500
From: Samuel Kayode <samkay014@gmail.com>
To: Sean Nyekjaer <sean@geanix.com>
Cc: Lee Jones <lee@kernel.org>, Lukas Bulwahn <lbulwahn@redhat.com>,
	Jerome Oufella <jerome.oufella@savoirfairelinux.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MAINTAINERS: update PF1550 driver email address
Message-ID: <aQgZ7zfdOHLcMw59@sam-fedora>
References: <20251101-update-email-v2-1-175d221ec40f@gmail.com>
 <zn6q6dsdihb6grnl6qllh26wegtcteh22fn6n6js334kwj2ea5@k2koqqtcvqg7>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zn6q6dsdihb6grnl6qllh26wegtcteh22fn6n6js334kwj2ea5@k2koqqtcvqg7>

On Sun, Nov 02, 2025 at 05:33:03PM +0000, Sean Nyekjaer wrote:
> On Sat, Nov 01, 2025 at 04:28:47PM +0100, Samuel Kayode wrote:
> > Update Sam's email address for the PF1550 PMIC driver.
> > 
> 
> Hi Sam,
> 
> Maybe update the .mailmap file with the new mail address?
> 
> /Sean

Will do.

Thanks,
Sam
